import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/shared/mocks.dart';

enum ProductsByCategoryViewState { loading, success, error }

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> _categoryProducts = [];
  List<Product> allProducts = [];
  List<String> brands = [];

  String _query = '';

  ProductsByCategoryViewState state = ProductsByCategoryViewState.loading;

  List<Product> get products {
    if (_query.isEmpty) return _categoryProducts;

    final query = _query.toLowerCase();
    return _categoryProducts.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query);
    }).toList();
  }

  void loadInitialData() {
    try {
      // Converte todo o JSON do mock para uma lista de Objetos do tipo Product
      allProducts = productsJson.map((item) => Product.fromJson(item)).toList();

      // Extrai apenas as marcas dos produtos, remove duplicados e transforma em lista
      brands = allProducts.map((product) => product.brand).toSet().toList();

      // Opcional: Deixa as marcas em ordem alfabética no dropdown
      brands.sort();
    } catch (e) {
      print("Erro ao carregar mock: $e");
    }
  }

  void changeState(ProductsByCategoryViewState newState) {
    state = newState;
    notifyListeners();
  }

  void search(String query) {
    _query = query;
    notifyListeners();
  }

  Future<void> getProductsByCategory(String category) async {
    changeState(ProductsByCategoryViewState.loading);

    await Future.delayed(Duration(seconds: 3));
    try {
      _categoryProducts = productsJson
          .map((item) => Product.fromJson(item))
          .where((product) => product.category == category)
          .toList();

      changeState(ProductsByCategoryViewState.success);
    } catch (e) {
      changeState(ProductsByCategoryViewState.error);
    }
  }
}
