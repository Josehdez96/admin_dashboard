import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 500,
      decoration: buildBoxDecoration(),
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