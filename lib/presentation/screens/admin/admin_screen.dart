import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/presentation/screens/admin/admin_screens/admin_dashboard_screen.dart';
import 'package:konbini/presentation/screens/admin/admin_screens/admin_maincategory_screen.dart';
import 'package:konbini/presentation/screens/admin/admin_screens/admin_subcategory_screen.dart';
import 'package:konbini/presentation/screens/admin/admin_screens/admin_vendorlist_screen.dart';
import 'package:konbini/presentation/screens/admin/admin_screens/admin_vendorrequest_screen.dart';
import 'package:konbini/presentation/screens/admin/components/drawer_footer_section.dart';
import 'package:konbini/presentation/screens/admin/components/drawer_header_section.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  static const String routeName = '/admin';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AdminScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  //for admin screen navigation
  Widget _selectedScreen = const AdminDashboardScreen();

  screenSelector(item) {
    switch (item.route) {
      case AdminDashboardScreen.routeName:
        setState(() {
          _selectedScreen = const AdminDashboardScreen();
        });
        break;
      case AdminMainCategoryScreen.routeName:
        _selectedScreen = const AdminMainCategoryScreen();
        setState(() {});
        break;
      case AdminSubCategoryScreen.routeName:
        setState(() {
          _selectedScreen = const AdminSubCategoryScreen();
        });
        break;
      case AdminVendorListScreen.routeName:
        setState(() {
          _selectedScreen = const AdminVendorListScreen();
        });
        break;
      case AdminVendorRequestScreen.routeName:
        setState(() {
          _selectedScreen = const AdminVendorRequestScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: baseColor),
          title: Text(
            'Admin Panel',
            style: TextStyle(color: baseColor),
          ),
        ),
        sideBar: SideBar(
          header: const DrawerHeaderSection(),
          footer: const DrawerFooterSection(),
          items: const [
            AdminMenuItem(
              title: 'Dashboard',
              route: AdminDashboardScreen.routeName,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Category',
              icon: Icons.category_rounded,
              children: [
                AdminMenuItem(
                  title: 'Main Category',
                  route: AdminMainCategoryScreen.routeName,
                ),
                AdminMenuItem(
                  title: 'Sub Category',
                  route: AdminSubCategoryScreen.routeName,
                ),
              ],
            ),
            AdminMenuItem(
              title: 'Vendor',
              icon: Icons.people_alt_rounded,
              children: [
                AdminMenuItem(
                  title: 'Vendor Request',
                  route: AdminVendorRequestScreen.routeName,
                ),
                AdminMenuItem(
                  title: 'Vendor List',
                  route: AdminVendorListScreen.routeName,
                ),
              ],
            ),
          ],
          selectedRoute: AdminScreen.routeName,
          onSelected: (item) {
            screenSelector(item);
          },
        ),
        body: _selectedScreen,
      ),
    );
  }
}
