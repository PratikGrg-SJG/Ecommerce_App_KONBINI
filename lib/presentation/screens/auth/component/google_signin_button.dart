import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:konbini/presentation/screens/landing_screen.dart';
import 'package:konbini/services/auth_service.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        EasyLoading.show(status: 'signing in...');
        User? user = await _authService.signInWithGoogle();
        EasyLoading.dismiss();

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingScreen(),
            ),
          );
        }
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 2.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/btn_google.png",
              // width: 90,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
