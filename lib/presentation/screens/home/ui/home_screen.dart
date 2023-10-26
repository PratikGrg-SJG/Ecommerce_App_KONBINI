import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konbini/presentation/screens/home/bloc/home_bloc.dart';
import 'package:konbini/presentation/screens/home/ui/components/carousel_section.dart';
import 'package:konbini/presentation/screens/home/ui/components/category_section.dart';
import 'package:konbini/presentation/screens/home/ui/components/latest_product_section.dart';
import 'package:konbini/presentation/screens/home/ui/components/offer_section.dart';
import 'package:konbini/presentation/screens/home/ui/components/popular_product_section.dart';
import 'package:konbini/presentation/screens/home/ui/components/search_cart._section.dart';
import 'package:konbini/presentation/screens/home/ui/components/top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  pinned: false,
                  floating: false,
                  elevation: 0,
                  backgroundColor: Colors.white,

                  // Add any additional styling properties to customize the app bar

                  flexibleSpace: TopSection(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SearchCartSectionDelegate(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const CarouselSection(),
                      const CategorySection(),
                      const LatestProductsSection(),
                      const OfferSection(),
                      const PopularProductSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchCartSectionDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors
          .white, // Customize the background color of the section if needed
      child: const SearchAndCart(),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
