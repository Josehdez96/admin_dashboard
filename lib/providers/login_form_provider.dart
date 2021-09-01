import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  late AuthProvider authProvider;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  LoginFormProvider(this.authProvider);

  validateForm() {
    if (formKey.currentState!.validate()) {
      authProvider.login(email, password);
    }
  }
}