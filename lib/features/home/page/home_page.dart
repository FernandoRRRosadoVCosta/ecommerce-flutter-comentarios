import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/features/home/page/widget/categories__state.dart';
import 'package:flutter_application_1/features/home/page/widget/products_section.dart';
import 'package:flutter_application_1/features/login/controllers/login_controller.dart';
import 'package:flutter_application_1/shared/app_colors.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeDilation) {
      context.read<HomeController>()
        ..getCategories()
        ..getproducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá ${loginController.user!.nome}',
              style: AppTextStyle.title,
            );
          },
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, homeCrontroller, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoriesSection(
                state: homeCrontroller.categoriesState,
                categories: homeCrontroller.categories,
              ),
              Text("Produtos", style: AppTextStyle.title),
              ProductsSection(
                state: homeCrontroller.productsState,
                products: homeCrontroller.products,
              ),
              Spacer(),

              ElevatedButton(
                onPressed: () {
                  homeCrontroller.getCategories();
                },
                child: Text('asdasd'),
              ),
            ],
          );
        },
      ),
    );
  }
}
