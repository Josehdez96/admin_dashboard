import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    formKey.currentState!.validate();
  }
}