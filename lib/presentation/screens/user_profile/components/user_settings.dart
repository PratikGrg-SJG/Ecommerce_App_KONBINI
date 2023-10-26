import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/data/user_setting_data/user_settings_data.dart';
import 'package:konbini/presentation/screens/auth/auth_screen.dart';
import 'package:konbini/presentation/screens/vendor/components/vendor_info_screen.dart';
import 'package:konbini/services/auth_service.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  static final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: setting.length,
      itemBuilder: (context, index) {
        final userSetting = setting[index];
        final isLogout = userSetting['title'] == 'Logout';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(
              userSetting['title'],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: secondaryColor3,
              child: Image.asset(
                userSetting['leadingIcon'],
                height: 25,
              ),
            ),
            trailing: isLogout
                ? null
                : const Icon(
                    Icons.chevron_right_rounded,
                    size: 30,
                  ),
            onTap: () {
              if (isLogout) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.only(top: 30, left: 50),
                      actionsPadding: const EdgeInsets.symmetric(vertical: 20),
                      // title: const Text("LogOut"),
                      content: const Text("Do you wish to logout ?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                _authService.logout();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ),
                                );
                              },
                              child: const Text("Yes"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor4,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              } else {
                if (userSetting['title'] == 'My Account') {
                } else if (userSetting['title'] == 'My Order') {
                } else if (userSetting['title'] == 'Messages') {
                } else if (userSetting['title'] == 'Address Book') {
                } else if (userSetting['title'] == 'Payment Methods') {
                } else if (userSetting['title'] == 'Vendor Request') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VendorInfoScreen(),
                    ),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
