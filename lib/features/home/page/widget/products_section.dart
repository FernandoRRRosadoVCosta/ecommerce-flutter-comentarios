import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/features/home/page/widget/products_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.state,
    required this.products,
  });
  final productsViewState state;
  final List<Products> products;
  static final List<Products> _fakeProducts = List.filled(
    4,
    Products(
      brand: 'Marca do produto',
      name: 'Nome do produto',
      imageUrl: '',
      price: 0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          if (state == productsViewState.erros)
            const Text("Problema ao products")
          else
            (Builder(
              builder: (context) {
                final isLoading = state == productsViewState.loading;
                final items = isLoading ? _fakeProducts : products;
                return Skeletonizer(
                  enabled: isLoading,
                  child: SizedBox(
                    height: 247,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: isLoading
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      child: IntrinsicHeight(
                        child: Row(
                          children: items.map((Products products) {
                            return ProductsCard(products: products);
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
        ],
      ),
    );
  }
}
