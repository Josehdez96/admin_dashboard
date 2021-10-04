import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:admin_dashboard/models/category.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDataTableSource(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final category = this.categories[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context, 
                  builder: ( _ ) => CategoryModal( category: category )
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.delete_forever, color: Colors.red.withOpacity(0.5)),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Estás seguro de borrarlo?'),
                  content: Text('¿Borrar definitivamente ${category.nombre}?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text('No')
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text('Si, borrar')
                    )
                  ],
                );

                showDialog(context: context, builder: ( _ ) => dialog);

              }
            )
          ],
        )),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
  
}