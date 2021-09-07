import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Row(
        children: [
          if (size.width > 700) Sidebar(),
          Expanded(
            child: Column(
              children: [
                Navbar(),
                Expanded(child: child)
              ],
            ),
          )
        ],
      )
    );
  }
}