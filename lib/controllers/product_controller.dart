import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel?> _allProducts = [];

  List<ProductModel?> get allProducts => [..._allProducts];

  Future<void> getData() async {
    try {
      Response response = await Dio().get(
          'https://my-project-1575392088489-default-rtdb.firebaseio.com/products.json');
      for (var item in response.data) {
        _allProducts.add(ProductModel.fromJson(item));
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
