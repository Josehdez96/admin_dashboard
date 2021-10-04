import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey();
  
  static showSnackbarError( String errMessage ) {
    final snackBarError = new SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        errMessage,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        )
    );

    messengerKey.currentState!.showSnackBar(snackBarError);
  }

  static showSnackbar( String message ) {
    final snackBar = new SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        )
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}