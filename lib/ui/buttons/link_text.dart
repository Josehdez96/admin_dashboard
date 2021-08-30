import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {

  final String text;
  final Function onPressed;

  const LinkText({
    Key? key,
    required this.text,
    required this.onPressed
    }) : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: ( _ ) => setState(() => isHover = true),
        onExit: ( _ ) => setState(() => isHover = false),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              decoration: isHover ? TextDecoration.underline : TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}