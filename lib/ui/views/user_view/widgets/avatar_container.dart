import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class AvatarContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.img == null) 
      ? Image(image: AssetImage('no-image.jpg'))
      : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);

    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text('Profile', style: CustomLabels.h2),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: ClipOval(
                      child: image
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        child: Icon(Icons.camera_alt_outlined, size: 20),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            allowMultiple: false
                          );

                          if (result != null) {
                            NotificationsService.showBusyIndicator(context);
                            PlatformFile file = result.files.first;
                            final modifiedUser = await userFormProvider.uploadImage('/uploads/usuarios/${user.uid}', file.bytes!);
                            Provider.of<UsersProvider>(context, listen: false).refreshUser(modifiedUser);
                            Navigator.of(context).pop();
                          } else {
                            // User canceled the picker
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              user.nombre,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    );
  }
}