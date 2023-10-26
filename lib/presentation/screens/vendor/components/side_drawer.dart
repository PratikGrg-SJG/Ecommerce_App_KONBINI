import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class VendorSideDrawer extends StatelessWidget {
  const VendorSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: baseColor,
              child: const Text(
                "V",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: Text(
              "Vendor Details",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const ListTile(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: baseColor,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text("Log out"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
