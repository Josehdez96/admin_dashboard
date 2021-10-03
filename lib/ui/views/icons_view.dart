import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons view', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center( child: Icon(Icons.ac_unit_outlined) )
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                width: 170,
                child: Center( child: Icon(Icons.access_alarm_outlined) )
              ),
              WhiteCard(
                title: 'access_time_filled_outlined',
                width: 170,
                child: Center( child: Icon(Icons.access_time_filled_outlined) )
              ),
              WhiteCard(
                title: 'access_time_rounded',
                width: 170,
                child: Center( child: Icon(Icons.access_time_rounded) )
              ),
              WhiteCard(
                title: 'all_inbox_outlined',
                width: 170,
                child: Center( child: Icon(Icons.all_inbox_outlined) )
              ),
              WhiteCard(
                title: 'description_outlined',
                width: 170,
                child: Center( child: Icon(Icons.description_outlined) )
              )
            ],
          )
        ],
      )
    );
  }
}