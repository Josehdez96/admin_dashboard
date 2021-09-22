import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final activeUser = Provider.of<AuthProvider>(context).user;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard view', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: activeUser!.nombre,
            child: Text(activeUser.correo)
          )
        ],
      )
    );
  }
}