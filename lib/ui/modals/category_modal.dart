import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? category;

  const CategoryModal({ Key? key, this.category }) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 500,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.category?.nombre ?? 'Nueva categoría', style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white)
              )
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 20),
          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: ( value ) => name = value,
            decoration: CustomInput.authInputDecoration(
              hint: 'Nombre de la categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined
            ),
            style: TextStyle(color: Colors.white),
          ),

          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              text: 'Guardar',
              color: Colors.white,
              onPressed: () async {
                try {
                  if (id == null) {
                    // create
                    await categoryProvider.newCategory(name);
                    NotificationsService.showSnackbar('Categoría creada');
                  } else {
                    // update
                    await categoryProvider.updateCategory(name, id!);
                    NotificationsService.showSnackbar('Categoría actualizada');
                  }
                  Navigator.pop(context);
                } catch (err) {
                  Navigator.pop(context);
                  NotificationsService.showSnackbarError('No se pudo guardar la categoría');
                }
                
              },
            ),
          )

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color(0xff0F2041),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );
}