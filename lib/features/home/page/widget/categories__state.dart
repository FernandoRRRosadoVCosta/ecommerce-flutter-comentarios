import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/features/home/page/widget/category_card.dart';

//TODO renomear para camelcase
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.state,
    required this.categories,
  });
  final CategoriesViewState state;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    print(state);
    return SizedBox(
      height: 170,
      child: Column(
        children: [
          if (state == CategoriesViewState.loading)
            const CircularProgressIndicator(),
          if (state == CategoriesViewState.erros)
            const Text("Problema ao Categories"),
          if (state == CategoriesViewState.success)
            SizedBox(
              height: 150,

              child: ListView.builder(
                itemCount: categories.length,

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCard(category: categories[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
