import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/features/home/page/widget/category_card.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO renomear para camelcase
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.state,
    required this.categories,
  });
  final CategoriesViewState state;
  final List<Category> categories;
  static final List<Category> _fakeCatogory = List.filled(
    4,
    Category(name: "Categor", imageUrl: ''),
  );

  @override
  Widget build(BuildContext context) {
    print(state);
    return SizedBox(
      height: 164,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categorias', style: AppTextStyle.title),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
          if (state == CategoriesViewState.erros)
            const Text("Problema ao Carregar Categorias")
          else
            (Builder(
              builder: (context) {
                final isLoading = state == CategoriesViewState.loading;
                final items = isLoading ? _fakeCatogory : categories;
                return Skeletonizer(
                  enabled: isLoading,
                  child: SizedBox(
                    height: 130,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: isLoading
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      child: IntrinsicHeight(
                        child: Row(
                          children: items.map((Category categories) {
                            return CategoryCard(category: categories);
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
