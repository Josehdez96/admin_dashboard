import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/category.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Categoria> categories;

  CategoriesDataTableSource(this.categories);

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
              onPressed: () {
                print('Category: ${category.id}');
              },
              icon: Icon(Icons.edit_outlined)
            ),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.delete_forever, color: Colors.red.withOpacity(0.5))
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