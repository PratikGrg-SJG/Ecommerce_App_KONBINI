import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/admin/admin_screen.dart';
import 'package:konbini/presentation/screens/auth/auth_screen.dart';
import 'package:konbini/presentation/screens/auth/login_screen.dart';
import 'package:konbini/presentation/screens/cart/cart_screen.dart';
import 'package:konbini/presentation/screens/category/category_screen.dart';
import 'package:konbini/presentation/screens/home/ui/home_screen.dart';
import 'package:konbini/presentation/screens/landing_screen.dart';
import 'package:konbini/presentation/screens/splash/splash_screen.dart';
import 'package:konbini/presentation/screens/user_profile/user_profile_screen.dart';
import 'package:konbini/presentation/screens/vendor/components/vendor_product_screen.dart';
import 'package:konbini/presentation/screens/vendor/vendor_addproduct_screen.dart';
import 'package:konbini/presentation/screens/vendor/vendor_dashboard_screen.dart';
import 'package:konbini/presentation/screens/vendor/vendor_registration_screen.dart';
import 'package:konbini/presentation/screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // print("This is route: ${settings.name}");

    switch (settings.name) {
      //auth
      case AuthScreen.routeName:
        return AuthScreen.route();

      case LoginScreen.routeName:
        return LoginScreen.route();

      //admin
      case AdminScreen.routeName:
        return AdminScreen.route();

      //vendor
      case VendorDashboardScreen.routeName:
        return VendorDashboardScreen.route();

      case VendorProductScreen.routeName:
        return VendorProductScreen.route();

      case VendorAddProductScreen.routeName:
        return VendorAddProductScreen.route();

      case VendorRegistrationScreen.routeName:
        return VendorRegistrationScreen.route();

      //user
      case "/":
        return LandingScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      case CateGoryScreen.routeName:
        return CateGoryScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case UserProfileScreen.routeName:
        return UserProfileScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case SplashScreen.routeName:
        return SplashScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text("ERROR"),
        ),
      ),
      settings: const RouteSettings(name: "/error"),
    );
  }
}
