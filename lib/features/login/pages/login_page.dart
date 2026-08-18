import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/controllers/login_controller.dart';
import 'package:flutter_application_1/features/recover/pages/recover_page.dart';
import 'package:flutter_application_1/features/signup/pages/signup_page.dart';
import 'package:flutter_application_1/shared/app_colors.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/widget/app_check_box.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();

  @override
  initState() {
    super.initState();
  }

  Future<void> _handleLogin() async {
    //futuramente não será necessário o setState, pois a tela será
    //reconstruida com o provider
    setState(() {
      loginController.isLoading = true;
    });

    await loginController.login();
    setState(() {
      loginController.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        image: AssetImage('assets/images/splash_screen.png'),
                      ),

                      Text('+DevsEcomm', style: AppTextStyle.title),
                    ],
                  ),
                  Spacer(flex: 6),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    errorText: loginController.emailError,
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),
                  Spacer(),

                  AppTextField(
                    hintText: '**************',
                    errorText: loginController.senhaError,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),
                  Row(
                    children: [
                      AppCheckBox(
                        value: loginController.isActiveCheckBox,
                        onChanged: (value) {
                          setState(() {
                            loginController.changeActiveCheckBox();
                          });
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
                        onPressed: () =>
                            Navigator.pushNamed(context, RecoverPage.route),
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
                    isLoading: loginController.isLoading,
                    onPressed: loginController.isActiveButton
                        ? _handleLogin
                        : null,
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
      ),
    );
  }
}
