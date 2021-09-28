import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Categories view', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Categorias titulo',
            child: Text('Hola')
          )
        ],
      )
    );
  }
}