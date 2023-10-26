import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/auth/auth_screen.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({
    super.key,
    required this.text,
    required this.controller,
    required this.onLastPage,
  });

  final String text;
  final PageController controller;
  final bool onLastPage;

  @override
  Widget build(BuildContext context) {
    return onLastPage
        ? ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AuthScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            child: Container(
              decoration: BoxDecoration(
                color: baseColor,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          );
  }
}
