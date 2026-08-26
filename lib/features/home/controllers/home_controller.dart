import 'package:flutter/material.dart';

enum CategoriesViewState { loading, success, erros }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  CategoriesViewState categoriesState = CategoriesViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  Future<void> getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = [
        for (var element in categoriesJson) Category.fromJson(element),
      ];
      changeCategoriesState(CategoriesViewState.success);
    } catch (e) {
      changeCategoriesState(CategoriesViewState.erros);
    }
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['name'], imageUrl: json['imageUrl']);
  }
}

class Products {
  final String brand;
  final String name;
  final String imageUrl;
  final String price;
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

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];
final List<Map<String, dynamic>> productsJson = [
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
];
