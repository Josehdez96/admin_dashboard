import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: (context) {

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                key: loginFormProvider.formKey,
                child: Column(
                  children: [

                    TextFormField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: CustomInput.authInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined
                      )
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if ( value.length < 6 ) return 'La contraseña debe ser de por lo menos 6 caracteres';
                        return null; // Válido
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: CustomInput.authInputDecoration(
                        hint: 'Ingrese su contraseña',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded
                      )
                    ),

                    SizedBox(height: 20),

                    CustomOutlinedButton(
                      onPressed: () => loginFormProvider.validateForm(),
                      text: 'Ingresar'
                    ),

                    SizedBox(height: 20),

                    LinkText(text: 'Nueva cuenta', onPressed: () {
                      Navigator.pushNamed(context, Flurorouter.registerRoute);
                    })

                  ],
                ),
              )
            )
          ),
        );
      })
    );
  }
}