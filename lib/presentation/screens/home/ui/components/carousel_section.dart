import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/services/firebase_service.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  
  final FirebaseService _service = FirebaseService();

  final List _bannerImages = [];

  @override
  void initState() {
    getBannerImages();
    super.initState();
  }

  // flutter fire approach
  // getBannerImages() {
  //   _service.homeBanner.get().then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       // print(doc["bannerImage"]);
  //       setState(() {
  //         _bannerImages.add(doc["bannerImage"]);
  //       });
  //     }
  //   });
  // }

//same but differently
  Future<void> getBannerImages() async {
    final querySnapshot = await _service.homeBanner.get();
    final results = [];
    for (var doc in querySnapshot.docs) {
      results.add(doc["bannerImage"]);
    }

    setState(() {
      _bannerImages.addAll(results);
    });
  }

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: secondaryColor3,
              height: 110,
              width: double.infinity,
              child: CarouselSlider(
                items: _bannerImages
                    .map((item) => CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),

        //dot indicator
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bannerImages.asMap().entries.map((entry) {
              // print(entry);
              // print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 12 : 5,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        currentIndex == entry.key ? secondaryColor1 : baseColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
