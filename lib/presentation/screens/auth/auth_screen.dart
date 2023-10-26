import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:konbini/presentation/screens/landing_screen.dart';

import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AuthScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            EasyLoading.show();
          }
          if (snapshot.hasData) {
            EasyLoading.dismiss();
            return const LandingScreen();
          } else {
            EasyLoading.dismiss();
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
