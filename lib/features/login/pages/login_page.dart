import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/page/home_page.dart';
import 'package:flutter_application_1/features/login/controllers/login_controller.dart';
import 'package:flutter_application_1/features/signup/pages/signup_page.dart';
import 'package:flutter_application_1/shared/app_colors.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/exceptions/auth_exception.dart';
import 'package:flutter_application_1/shared/widget/app_check_box.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginController>(
          builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Form(
                key: controller.key,
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(flex: 3),
                        Column(
                          spacing: 10,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/splash_screen.png',
                              ),
                            ),

                            Text('+DevsEcomm', style: AppTextStyle.title),
                          ],
                        ),
                        Spacer(flex: 6),
                        AppTextField(
                          controller: controller.emailController,
                          hintText: 'email@dominio.com',
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          // onChanged: (value) {
                          //   setState(() {
                          //     loginController.setEmail(value);
                          //   });
                          // },
                        ),
                        Spacer(),

                        AppTextField(
                          controller: controller.senhaController,
                          hintText: '**************',
                          obscureText: true,
                          validator: (value) {
                            return controller.validateSenha(value);
                          },
                          // onChanged: (value) {
                          //   setState(() {
                          //     loginController.setSenha(value);
                          //   });
                          // },
                        ),
                        Row(
                          children: [
                            AppCheckBox(
                              value: controller.isActiveCheckbox,
                              onChanged: (value) {
                                controller.changeActiveCheckBox();
                              },
                            ),
                            Text('Lembrar-me', style: AppTextStyle.corpoTitle),
                          ],
                        ),

                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                SignupPage.route,
                              ),
                              child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        AppElevatedButton(
                          buttonText: 'Entrar',
                          isLoading: controller.isLoading,
                          onPressed: () async {
                            try {
                              await controller.handleLogin();
                              if (!context.mounted) return;
                              Navigator.popAndPushNamed(
                                context,
                                HomePage.route,
                              );
                            } on AuthException catch (e) {
                              AnimatedSnackBar.material(
                                e.massage,
                                type: AnimatedSnackBarType.error,
                                mobileSnackBarPosition:
                                    MobileSnackBarPosition.bottom,
                              ).show(context);
                            }
                          },
                          type: ButtonType.filled,
                        ),
                        SizedBox(height: 17),
                        AppElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            SignupPage.route,
                            arguments: 'vin',
                          ),
                          type: ButtonType.outlined,
                          buttonText: 'Cadastrar-se',
                        ),
                        Spacer(flex: 2),
                        GestureDetector(
                          onTap: () {
                            print('CLIQUEI NA LINHA');
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Termos de Serviço ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'e',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextSpan(
                                  text: ' Política de Privacidade',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
