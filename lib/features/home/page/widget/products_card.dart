import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';

import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicou no produto ${product.name}');
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: AppTextStyle.title),
                  SizedBox(height: 100, width: 700),
                  Text(product.brand, style: AppTextStyle.smallGrey),
                  SizedBox(height: 100, width: 700),
                  Text(
                    '\$${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: AppTextStyle.smallGreen,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Skeleton.replace(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(product.brand, style: AppTextStyle.smallGrey),
          Text(product.name, style: AppTextStyle.smallBlack),
          Text(
            '\$${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
            style: AppTextStyle.smallGreen,
          ),
        ],
      ),
    );
  }
}
