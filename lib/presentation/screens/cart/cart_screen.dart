import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/cart/components/cart_card.dart';
import 'package:konbini/presentation/screens/cart/components/checkout_card.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = "/cart";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: "Your Cart"),
      body: Stack(children: [
        CartCard(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CheckOutCard(),
        ),
      ]),
    );
  }
}
