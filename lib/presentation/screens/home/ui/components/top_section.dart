import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/models/user_model.dart';

class TopSection extends StatefulWidget {
  const TopSection({
    super.key,
  });

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  UserModel? user;

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  fetchUserData() async {
    user = await UserModel().fetchUserDataUsingModel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets/images/logo.png")),
          user != null && user!.userImage!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: baseColor,
                    height: double.infinity,
                    child: Image.network(
                      user!.userImage!.toString(),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 25,
                  backgroundColor: baseColor,
                  child: Text(
                    user != null ? user!.userName![0].toUpperCase() : 'U',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )),
        ],
      ),
    );
  }
}
