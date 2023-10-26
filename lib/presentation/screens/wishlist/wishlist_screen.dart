import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/wishlist/components/wishlist_card.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static const String routeName = "/wishlist";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WishlistScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:
          CustomAppbar(title: "WishList", iconPath: "assets/icons/cart.png"),
      body: WishListCard(),
    );
  }
}
