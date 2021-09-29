import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({ Key? key }) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Categories view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDataTableSource(),
            header: Text('Categorías disponibles', maxLines: 2),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: ( value ) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            actions: [
              CustomIconButton(
                onPressed: () {}, 
                text: 'Crear', 
                icon: Icons.add_outlined
              )
            ],
          )
        ],
      )
    );
  }
}