import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/onboard/components/onboard_button.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.controller,
    required this.onLastPage,
  });

  final String image, title, description;
  final PageController controller;
  final bool onLastPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 320,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 80,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: baseColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  // color: Colors.red,
                  width: 250,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                //next or get started button
                onLastPage
                    ? OnboardButton(
                        text: "Let's Get Started",
                        controller: controller,
                        onLastPage: onLastPage,
                      )
                    : OnboardButton(
                        text: "Next",
                        controller: controller,
                        onLastPage: onLastPage,
                      ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
