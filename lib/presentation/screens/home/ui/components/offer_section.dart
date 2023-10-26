import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/home/models/offer_product_model.dart';
import 'package:konbini/presentation/widgets/title_template.dart';

class OfferSection extends StatefulWidget {
  const OfferSection({super.key});

  @override
  State<OfferSection> createState() => _OfferSectionState();
}

class _OfferSectionState extends State<OfferSection> {
  final offerProduct = offerProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          //title
           TitleTemplate(
            title: "Sale",
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
            itemCount: offerProduct.length,
            itemBuilder: (context, index) {
              final product = offerProduct[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  // color: Colors.amber,
                  // height: 100,
                  color: secondaryColor3,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: SizedBox(
                                width: double.infinity,
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                        ),
                                        Text(product.category,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall),
                                        // const SizedBox(
                                        //   height: 2,
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: product.offerPrice,
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const TextSpan(text: '   '),
                                              TextSpan(
                                                text: product.price,
                                                style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough, // Add a line-through effect to the old price
                                                  color: Colors
                                                      .grey, // Set a different color for the old price
                                                ),
                                              ),
                                              // Add some spacing between the prices
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 110,
                        top: 10,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              product.offerPercent,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
