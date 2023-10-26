import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: secondaryColor3,
              height: 140,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      //image section
                      child: SizedBox(
                        height: double.infinity,
                        width: 100,
                        child: Image.asset(
                          "assets/products/product2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //detials section
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Name",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const Text(
                                  "Seller Name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Text(
                                  "Size :",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Text(
                                  "Color :",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Price",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.delete,
                              color: Colors.red.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
