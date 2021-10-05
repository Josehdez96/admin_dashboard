import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);

    final usersDataSource = new UsersDataSource(usersProvider.users);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Users view', style: CustomLabels.h1),
          SizedBox(height: 10),

          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(label: Text('Nombre'), onSort: ( colIndex , __ ) {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.nombre);
              }),
              DataColumn(label: Text('Email'), onSort: ( colIndex , __ ) {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.correo);
              }),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Acciones')),
            ], 
            source: usersDataSource,
            onPageChanged: ( page ) {
              print(page);
            },
          )
        ],
      )
    );
  }
}