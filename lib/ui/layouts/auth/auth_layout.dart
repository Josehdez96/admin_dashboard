import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _DesktopBody()
          // Mobile
          // Links
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({ Key? key }) : super(key: key);

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
                CustomTitle(),
                SizedBox(height: 50),
                // Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}