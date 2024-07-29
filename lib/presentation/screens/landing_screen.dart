import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/category/category_screen.dart';
import 'package:konbini/presentation/screens/home/bloc/home_bloc.dart';
import 'package:konbini/presentation/screens/home/ui/home_screen.dart';
import 'package:konbini/presentation/screens/user_profile/user_profile_screen.dart';
import 'package:konbini/presentation/screens/wishlist/wishlist_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, this.index});
  //index from other screen or for initial index

  final int? index;

  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LandingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Widget> screens = [];

  int _currentIndex = 0;

  ontap(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    screens = [
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      const CateGoryScreen(),
      const WishlistScreen(),
      const UserProfileScreen(),
    ];
    // print(user);

    if (widget.index != null) {
      setState(() {
        _currentIndex = widget.index!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeScreen = screens[_currentIndex];
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Image.asset(
              "assets/icons/home.png",
              height: 30,
              color: _currentIndex == 0 ? primaryColor : baseColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Image.asset(
              "assets/icons/category.png",
              height: 30,
              color: _currentIndex == 1 ? primaryColor : baseColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Wishlist",
            icon: Image.asset(
              "assets/icons/heart.png",
              height: 30,
              color: _currentIndex == 2 ? primaryColor : baseColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: Image.asset(
              "assets/icons/user.png",
              height: 30,
              color: _currentIndex == 3 ? primaryColor : baseColor,
            ),
          ),
        ],
      ),
    );
  }
}