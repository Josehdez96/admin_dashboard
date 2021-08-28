import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _DesktopBody(child: child)
          // Mobile
          // Links
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
      child: Row(
        children: [
          BackgroundTwitter(),

          // View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTitle(),
                SizedBox(height: 50),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}