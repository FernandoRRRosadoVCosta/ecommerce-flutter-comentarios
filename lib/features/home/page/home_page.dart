import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/controllers/home_controller.dart';
import 'package:flutter_application_1/features/login/controllers/login_controller.dart';
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
    context.read<HomeController>().getCategories();
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
            children: [
              SizedBox(
                height: 108,
                child: switch (homeCrontroller.categoriesState) {
                  CategoriesViewState.loading => CircularProgressIndicator(),
                  CategoriesViewState.erros => Text('Problema ao categorias'),
                  CategoriesViewState.success => Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
