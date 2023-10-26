import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/home/models/popular_product_model.dart';
import 'package:konbini/presentation/screens/home/ui/components/product_card.dart';
import 'package:konbini/presentation/widgets/title_template.dart';

class PopularProductSection extends StatefulWidget {
  const PopularProductSection({super.key});

  @override
  State<PopularProductSection> createState() => _PopularProductSectionState();
}

class _PopularProductSectionState extends State<PopularProductSection> {
  final List<PopularProductModel> popularProduct = popularProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          //title
          TitleTemplate(
            title: "Best Selling",
            trailingText: "",
            onTapFunc: () {},
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
            itemCount: popularProduct.length,
            itemBuilder: (context, index) {
              final product = popularProduct[index];
              return ProductCard(
                  imagePath: product.imagePath,
                  productName: product.name,
                  productCateg: product.category,
                  productPrice: product.price);
            },
          )
        ],
      ),
    );
  }
}
