import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/user_profile/components/top_section_user.dart';
import 'package:konbini/presentation/screens/user_profile/components/user_settings.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  static const String routeName = "/user_profile";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UserProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(user);
    return Scaffold(
      backgroundColor: secondaryColor3,
      appBar: const CustomAppbar(title: "User Profile"),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: const Column(
              children: [
                TopSectionUser(),
                Expanded(child: UserSettings()),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
