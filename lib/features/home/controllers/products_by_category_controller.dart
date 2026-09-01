import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Products> productByCategory = [];
  List<Products> products = [];

  getProductsByCategory(String categoryName) {
    //TODO bater no metodo do contrller  que filtra apenas produtos pela categoryName
    productByCategory = products
        .where((product) => product.category == categoryName)
        .toList();
    notifyListeners();
  }
}
