import 'package:flutter/material.dart';

class UsersDataSource extends DataTableSource {


  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('Hola Avatar $index')),
        DataCell(Text('Hola Nombre $index')),
        DataCell(Text('Hola Email $index')),
        DataCell(Text('Hola UID $index')),
        DataCell(Text('Hola Acciones $index')),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 251;

  @override
  int get selectedRowCount => 0;
  
}