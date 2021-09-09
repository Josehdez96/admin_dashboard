import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard view', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Sales Statistics',
            child: Text('Hola')
          )
        ],
      )
    );
  }
}