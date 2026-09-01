import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/features/home/page/products_by_category_page.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO refatorar para camel case
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsByCategoryPage.route,
          arguments: category.name,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 141,
        child: Column(
          children: [
            Skeleton.replace(
              replacement: Bone.circle(size: 80),
              child: Image.network(category.imageUrl),
            ),

            Text(category.name, style: AppTextStyle.corpoTitle),
          ],
        ),
      ),
    );
  }
}
