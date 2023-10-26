import 'package:flutter/material.dart';
import 'package:konbini/presentation/screens/vendor/vendor_registration_screen.dart';
import 'package:konbini/presentation/widgets/custom_appbar.dart';

class VendorInfoScreen extends StatelessWidget {
  const VendorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Vendor Regulations"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              "If you want to register as a vendor,",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, VendorRegistrationScreen.routeName);
                },
                child: Text(
                  "click here",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15, color: Colors.blue[400]),
                ))
          ],
        ),
      ),
    );
  }
}
