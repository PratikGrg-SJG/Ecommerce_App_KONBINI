import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/product/components/bottombar.dart';
import 'package:konbini/presentation/screens/product/components/productdetailsbody.dart';
import 'package:konbini/presentation/screens/product/components/productimage.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    this.productDescription,
  });

  final String imagePath, productName, productCategory, productPrice;
  final String? productDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
          title: "Product Details", iconPath: "assets/icons/cart.png"),
      body: Column(
        children: [
          ProductImage(imagePath: imagePath),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ProductDetailsBody(productName: productName),
          ),
        ],
      ),
      bottomNavigationBar: ProductScreenBottomBar(productPrice: productPrice),
    );
  }
}
