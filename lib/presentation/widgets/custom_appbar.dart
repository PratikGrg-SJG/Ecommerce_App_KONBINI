import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konbini/config/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.iconPath,
  });

  final String title;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return iconPath == null
        ? AppBar(
            //to change color of status bar items must***
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(
                color: Color(0xff2D2E4A),
                fontSize: 22,
              ),
            ),
            iconTheme: IconThemeData(color: baseColor),
          )
        : AppBar(
            //to change color of status bar items must***
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(
                color: Color(0xff2D2E4A),
                fontSize: 22,
              ),
            ),
            iconTheme: IconThemeData(color: baseColor),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Container(
                      color: secondaryColor3,
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Image.asset(
                          iconPath!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
