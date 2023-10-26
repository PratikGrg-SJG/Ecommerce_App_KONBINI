import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/home/models/category_model.dart';
import 'package:konbini/presentation/screens/landing_screen.dart';
import 'package:konbini/presentation/widgets/title_template.dart';
import 'package:konbini/services/firebase_service.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  final FirebaseService _service = FirebaseService();
  final List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    final querySnapshot =
        await _service.category.orderBy('categoryName', descending: true).get();
    final List<CategoriesModel> results = [];
    for (var doc in querySnapshot.docs) {
      results.add(
          CategoriesModel.fromFirestore(doc.data() as Map<String, dynamic>));
    }

    setState(() {
      categories.addAll(results);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          TitleTemplate(
            title: "Categories",
            trailingText: "See All",
            onTapFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingScreen(index: 1),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                height: 50,
                color: secondaryColor3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: baseColor, fontSize: 13),
                    ),
                    categories.isEmpty
                        ? Container(
                            height: 40,
                          )
                        : CachedNetworkImage(
                            color: baseColor,
                            imageUrl: category.image,
                            height: 40,
                          ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
