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
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      'nombre': name
    };
    try {
      final resp = await CafeApi.httpPost('/categorias', data);
      final categoryJson = Categoria.fromMap(resp);
      categories.add(categoryJson);
      notifyListeners();
    } catch (e) {
      print('We got an error on newCategory --> $e');
    }
  }

  Future updateCategory(String name, String id) async {
    final data = {
      'nombre': name
    };
    try {
      await CafeApi.httpPut('/categorias/$id', data);
      this.categories = this.categories.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      print('We got an error on update --> $e');
    }
  }
}