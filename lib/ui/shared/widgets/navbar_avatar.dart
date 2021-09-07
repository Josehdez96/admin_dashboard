import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://images.unsplash.com/photo-1565800489013-c64859d0c2d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw5NTYyMjA4fHxlbnwwfHx8fA%3D%3D&w=1000&q=80'),
        width: 30,
        height: 30
      ),
    );
  }
}