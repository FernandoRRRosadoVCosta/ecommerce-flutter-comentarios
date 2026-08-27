import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/shared/mocks.dart';

enum CategoriesViewState { loading, success, erros }

enum productsViewState { loading, success, erros }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  List<Products> products = [];
  CategoriesViewState categoriesState = CategoriesViewState.loading;
  productsViewState productsState = productsViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  void changeproductsState(productsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future<void> getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      // categories = [
      //   for (var element in categoriesJson) Category.fromJson(element),
      // ];
      categories = categoriesJson.map((item) {
        return Category.fromJson(item);
      }).toList();

      changeCategoriesState(CategoriesViewState.success);
    } catch (e) {
      changeCategoriesState(CategoriesViewState.erros);
    }
  }

  Future<void> getproducts() async {
    changeproductsState(productsViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      products = productsJson.map((item) {
        return Products.fromJson(item);
      }).toList();
      changeproductsState(productsViewState.success);
    } catch (e) {
      changeproductsState(productsViewState.erros);
    }
  }
}

class Products {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;
  Products({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}
