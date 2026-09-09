import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/shared/mocks.dart';

enum ProductsByCategoryViewState { loading, success, error }

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> _categoryProducts = [];
  List<Product> allProducts = [];
  List<String> brands = [];

  String _query = '';
  String _selectedBrand = '';

  ProductsByCategoryViewState state = ProductsByCategoryViewState.loading;

  List<Product> get products {
    if (_query.isEmpty && _selectedBrand == 'Todos') return _categoryProducts;

    final query = _query.toLowerCase();
    return _categoryProducts.where((product) {
      if (_query.isNotEmpty && _selectedBrand != 'Todos') {
        return product.name.toLowerCase().contains(query) &&
            product.brand == _selectedBrand;
      } else if (_query.isNotEmpty) {
        return product.name.toLowerCase().contains(query);
      } else if (_selectedBrand != 'Todos') {
        return product.brand == _selectedBrand;
      }
      return product.name.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query);
    }).toList();
  }

  Future<void> getProductsByBrand() async {
    changeState(ProductsByCategoryViewState.loading);
    try {
      brands = _categoryProducts
          .map((item) {
            return item.brand;
          })
          .toList()
          .toSet()
          .toList();
      print(brands);

      changeState(ProductsByCategoryViewState.success);
    } catch (e) {
      changeState(ProductsByCategoryViewState.error);
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

  void selectBrand(String brand) {
    _selectedBrand = brand;
    notifyListeners();
  }

  Future<void> getProductsByCategory(String category) async {
    _selectedBrand = 'Todos';
    _query = '';
    changeState(ProductsByCategoryViewState.loading);

    await Future.delayed(Duration(seconds: 3));
    try {
      _categoryProducts = productsJson
          .map((item) => Product.fromJson(item))
          .where((product) => product.category == category)
          .toList();
      getProductsByBrand();
      changeState(ProductsByCategoryViewState.success);
    } catch (e) {
      changeState(ProductsByCategoryViewState.error);
    }
  }
}
