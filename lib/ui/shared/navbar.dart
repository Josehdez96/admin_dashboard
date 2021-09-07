import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/searchbar.dart';

class Navbar extends StatelessWidget {
  const Navbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: 10),
          // TODO Hamburger icon
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: Searchbar(),
          ),
          Spacer(),
          NotificationIndicator(),
          SizedBox(width: 15),
          NavbarAvatar(),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}