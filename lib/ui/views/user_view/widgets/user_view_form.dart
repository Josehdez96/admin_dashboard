import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class UserViewForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información general',
      child: Form(
        // TODO: key
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              decoration: CustomInput.formInputDecoration(
                hint: 'Nombre del usuario', 
                label: 'Nombre', 
                icon: Icons.supervised_user_circle_outlined
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              decoration: CustomInput.formInputDecoration(
                hint: 'Correo del usuario', 
                label: 'Correo', 
                icon: Icons.mark_email_read_outlined
              ),
            ),

            SizedBox(height: 20),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 113),
              child: ElevatedButton(
                onPressed: () {},
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