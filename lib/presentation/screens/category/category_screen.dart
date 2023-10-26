import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/category/components/category_list.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class CateGoryScreen extends StatelessWidget {
  const CateGoryScreen({super.key});

  static const String routeName = "/category";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CateGoryScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:
          CustomAppbar(title: "Category", iconPath: "assets/icons/cart.png"),
      body: CategoryList(),
    );
  }
}
