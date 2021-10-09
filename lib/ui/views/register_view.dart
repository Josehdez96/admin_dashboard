import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(builder: (context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 45),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
      
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.name = value,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: CustomInput.authInputDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        icon: Icons.supervised_user_circle_sharp
                      )
                    ),
      
                    SizedBox(height: 20),
      
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.email = value,
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
                      validator: (value) {
                        if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if ( value.length < 6 ) return 'La contraseña debe ser de por lo menos 6 caracteres';
                        return null; // Válido
                      },
                      onChanged: (value) => registerFormProvider.password = value,
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
                      onPressed: () {
                        final validForm = registerFormProvider.validateForm();
                        if (!validForm) return;

                        final authProvider = Provider.of<AuthProvider>(context, listen: false);
                        authProvider.register(
                          registerFormProvider.email,
                          registerFormProvider.password,
                          registerFormProvider.name);
                      },
                      text: 'Crear cuenta'
                    ),
      
                    SizedBox(height: 20),
      
                    LinkText(text: 'Ir al login', onPressed: () {
                      Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                    })
      
      
                  ],
                ),
              )
            )
          ),
        );
      }
      )
    );
  }
}