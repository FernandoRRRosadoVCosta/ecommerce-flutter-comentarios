import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/models/category_model.dart';
import 'package:flutter_application_1/features/home/models/products_model.dart';
import 'package:flutter_application_1/features/home/page/widget/categories__state.dart';
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
              SizedBox(
                height: 250,
                child: switch (homeCrontroller.productsState) {
                  productsViewState.loading => CircularProgressIndicator(),
                  productsViewState.erros => Text('Problema ao Products'),
                  productsViewState.success => SizedBox(
                    child: ListView.builder(
                      itemCount: homeCrontroller.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Products products = homeCrontroller.products[index];
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(products.imageUrl),
                              Text(
                                products.brand,
                                style: TextStyle(color: AppColors.grey),
                              ),
                              Text(products.name, style: AppTextStyle.title),
                              Text(
                                products.price.toString(),
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  homeCrontroller.getproducts();
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
