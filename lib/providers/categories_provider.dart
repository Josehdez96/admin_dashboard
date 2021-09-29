import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesJson = CategoriesResponse.fromMap(resp);
    this.categories = [...categoriesJson.categorias];
    print(this.categories);
    notifyListeners();
  }
}