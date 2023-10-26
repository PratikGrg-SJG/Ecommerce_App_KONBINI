import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/home/models/latest_product_model.dart';
import 'package:konbini/presentation/screens/home/ui/components/product_card.dart';
import 'package:konbini/presentation/screens/product/product_screen.dart';
import 'package:konbini/presentation/widgets/title_template.dart';

class LatestProductsSection extends StatefulWidget {
  const LatestProductsSection({super.key});

  @override
  State<LatestProductsSection> createState() => _LatestProductsSectionState();
}

class _LatestProductsSectionState extends State<LatestProductsSection> {
  final List<LatestProductModel> latestProducts = products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          //title
           TitleTemplate(
            title: "Latest Arrivals",
            trailingText: "See More",
            onTapFunc: (){},
          ),

          const SizedBox(
            height: 10,
          ),

          //product view

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final latestProduct = latestProducts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                          imagePath: latestProduct.imagePath,
                          productName: latestProduct.name,
                          productCategory: latestProduct.category,
                          productPrice: latestProduct.price),
                    ),
                  );
                },
                child: ProductCard(
                    imagePath: latestProduct.imagePath,
                    productName: latestProduct.name,
                    productCateg: latestProduct.category,
                    productPrice: latestProduct.price),
              );
            },
          )
        ],
      ),
    );
  }
}
