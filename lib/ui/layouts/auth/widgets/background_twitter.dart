import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackgroundImage(),
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image(
              image: AssetImage('twitter-white-logo.png'),
              width: 400,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('twitter-bg.png'),
          fit: BoxFit.cover
        )
      );
  }
}