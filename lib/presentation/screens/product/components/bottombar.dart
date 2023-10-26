import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class ProductScreenBottomBar extends StatelessWidget {
  const ProductScreenBottomBar({
    super.key,
    required this.productPrice,
  });

  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // color: Colors.red,
      elevation: 0,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              // color: Colors.red,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 16),
                  ),
                  Text(
                    productPrice,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              height: 70,
              width: 160,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: 60,
                  color: baseColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/icons/heart.png",
                      color: Colors.white,
                    ),
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
