import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productCateg,
    required this.productPrice,
  });

  final String imagePath, productName, productCateg, productPrice;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // color: Colors.amber,
        // height: 100,
        color: secondaryColor3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: SizedBox(
                  width: double.infinity,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(overflow: TextOverflow.ellipsis),
                          ),
                          Text(productCateg,
                              style: Theme.of(context).textTheme.labelSmall),
                          // const SizedBox(
                          //   height: 2,
                          // ),
                        ],
                      ),
                      Text(
                        productPrice,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
