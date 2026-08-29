import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/shared/app_colors.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key, required this.products});

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 480,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(products.imageUrl),
          Text(products.brand, style: TextStyle(color: AppColors.grey)),
          Text(products.name, style: AppTextStyle.title),
          Text(
            products.price.toString(),
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
