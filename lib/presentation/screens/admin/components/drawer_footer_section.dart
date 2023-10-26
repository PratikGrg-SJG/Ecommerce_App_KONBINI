import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class DrawerFooterSection extends StatelessWidget {
  const DrawerFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        color: baseColor,
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
