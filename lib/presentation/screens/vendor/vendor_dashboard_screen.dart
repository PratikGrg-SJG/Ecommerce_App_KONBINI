import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/home/ui/components/product_card.dart';
import 'package:konbini/presentation/screens/vendor/components/add_product_button.dart';
import 'package:konbini/presentation/screens/vendor/components/side_drawer.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  static const routeName = "/vendorDashboard";

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const VendorDashboardScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //to change color of status bar items must***
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Dashboard",
          style: TextStyle(color: baseColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: baseColor,
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: const VendorSideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Vendor Name!', // Replace 'Vendor Name' with actual vendor name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const AddProductButton(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ProductCard(
                      imagePath: 'assets/products/op1.jpg',
                      productName: "Test",
                      productCateg: "Test",
                      productPrice: "100");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
