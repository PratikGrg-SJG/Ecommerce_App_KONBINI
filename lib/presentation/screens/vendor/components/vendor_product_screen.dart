import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class VendorProductScreen extends StatelessWidget {
  const VendorProductScreen({super.key});

  static const String routeName = "/vendorProduct";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VendorProductScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "Products (Vendor)"),
        body: const Center(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: baseColor,
          onPressed: () {
            Navigator.pushNamed(context, '/vendorAddProduct');
          },
          child: const Icon(Icons.add),
        ));
  }
}
