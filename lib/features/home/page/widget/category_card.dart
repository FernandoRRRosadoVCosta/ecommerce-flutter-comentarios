import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';

//TODO refatorar para camel case
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      child: Column(
        children: [
          Image.network(category.imageUrl),
          Text(category.name, style: AppTextStyle.title),
        ],
      ),
    );
  }
}
