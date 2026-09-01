import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/products_by_category_controller.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});
  static String route = '/products-by-category';
  final String categoryName;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TODO bater no metodo do contrller  que filtra apenas produ
    //tos pela categoryName
    WidgetsBinding.instance.addPostFrameCallback((timeDilation) {
      context.read<ProductsByCategoryController>().getProductsByCategory(
        widget.categoryName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: Consumer<ProductsByCategoryController>(
        builder: (context, controller, child) {
          return GridView.count(
            crossAxisCount: 2,
            children: controller.productByCategory.map((product) {
              return Card(
                child: Column(
                  children: [
                    Text(product.name),
                    Text('R\$ ${product.price.toStringAsFixed(2)}'),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
