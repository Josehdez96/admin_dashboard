import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class UserViewForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información general',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              decoration: CustomInput.formInputDecoration(
                hint: 'Nombre del usuario', 
                label: 'Nombre', 
                icon: Icons.supervised_user_circle_outlined
              ),
              onChanged: ( value ) => userFormProvider.copyUserWith( nombre: value ),
              validator: ( value ) {
                if (value == null || value.isEmpty) return 'Ingrese un nombre';
                if (value.length < 2) return 'El nombre debe de ser de dos letras como mínimo';
                return null;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              initialValue: user.correo,
              decoration: CustomInput.formInputDecoration(
                hint: 'Correo del usuario', 
                label: 'Correo', 
                icon: Icons.mark_email_read_outlined
              ),
              onChanged: ( value ) => userFormProvider.copyUserWith( correo: value ),
              validator: ( value ) {
                if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                return null;
              },
            ),

            SizedBox(height: 20),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 113),
              child: ElevatedButton(
                onPressed: () async {
                  final saved = await userFormProvider.updateUser();
                  if ( saved ) {
                    NotificationsService.showSnackbar('Usuario actualizado');
                    Provider.of<UsersProvider>(context, listen: false).refreshUser(user);
                  } else {
                    NotificationsService.showSnackbarError('No se pudo guardar');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)
                ),
                child: Row(
                  children: [
                    Icon(Icons.save_outlined),
                    Text(' Guardar')
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }
}