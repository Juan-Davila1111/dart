import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    final String response =
        await rootBundle.loadString('assets/mock/categories.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
