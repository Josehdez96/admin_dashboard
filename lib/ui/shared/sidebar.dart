import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_element.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'main'),
          MenuElement(
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuElement(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Categories',
              icon: Icons.layers_outlined,
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
              onPressed: () => navigateTo(Flurorouter.categoriesRoute)),
          MenuElement(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Users',
              icon: Icons.people_alt_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
              onPressed: () => navigateTo(Flurorouter.usersRoute)),
          SizedBox(height: 30),
          TextSeparator(text: 'UI Elements'),
          MenuElement(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          MenuElement(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          MenuElement(
              text: 'Blank',
              icon: Icons.post_add_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              onPressed: () => navigateTo(Flurorouter.blankRoute)),
          SizedBox(height: 50),
          TextSeparator(text: 'Exit'),
          MenuElement(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                authProvider.logout();
                navigateTo(Flurorouter.loginRoute);
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092042)]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
