import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: buildInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined
                  )
                ),

                SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: buildInputDecoration(
                    hint: 'Ingrese su contraseña',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded
                  )
                ),

                SizedBox(height: 20),

                CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Ingresar'
                ),

                SizedBox(height: 20),

                LinkText(text: 'Nueva cuenta', onPressed: () {
                  // TODO: go to register
                })


              ],
            ),
          )
        )
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) => InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
    ),
    hintText: hint,
    labelText: label,
    hintStyle: TextStyle(color: Colors.grey),
    labelStyle: TextStyle(color: Colors.grey),
    prefixIcon: Icon(icon, color: Colors.grey),
  );
}