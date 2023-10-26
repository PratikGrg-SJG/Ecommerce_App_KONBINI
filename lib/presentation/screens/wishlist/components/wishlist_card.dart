import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/product/product_screen.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Slidable(
            endActionPane: ActionPane(
                extentRatio: 0.3,
                motion: const ScrollMotion(),
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.circular(15),
                    onPressed: (context) {},
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                  ),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductScreen(
                          imagePath: "assets/products/product1.jpg",
                          productName: "Overfit Summer T-Shirt",
                          productCategory: "T-Shirt",
                          productPrice: "Rs 200"),
                    ),
                  );
                },
                child: Container(
                  color: secondaryColor3,
                  height: 120,
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
                              "assets/products/product1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          //detials section
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Text(
                                "Seller Name",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      "Move to Cart",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: secondaryColor3,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
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
            ),
          ),
        );
      },
    );
  }
}
