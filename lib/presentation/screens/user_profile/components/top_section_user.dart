import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/models/user_model.dart';

class TopSectionUser extends StatefulWidget {
  const TopSectionUser({super.key});

  @override
  State<TopSectionUser> createState() => _TopSectionUserState();
}

class _TopSectionUserState extends State<TopSectionUser> {
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
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            (user != null &&
                    user!.userImage != null &&
                    user!.userImage!.isNotEmpty)
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      user!.userImage.toString(),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: secondaryColor3,
                    radius: 30,
                    child: Text(
                      user != null &&
                              user!.userName != null &&
                              user!.userName!.isNotEmpty
                          ? user!.userName![0].toUpperCase()
                          : 'U',
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
            const SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user != null
                    ? Text(user!.userName.toString())
                    : const Text('blabala'),
                (user != null)
                    ? Text(
                        user!.userEmail.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey.shade400),
                      )
                    : Text(
                        "User Email",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey.shade400),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
