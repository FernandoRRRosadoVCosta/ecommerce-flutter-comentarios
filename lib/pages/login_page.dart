import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/shared/app_colors.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex: 3),
              Column(
                spacing: 10,
                children: [
                  Image(image: AssetImage('assets/images/splash_screen.png')),

                  Text('+DevsEcomm', style: AppTextStyle.title),
                ],
              ),
              Spacer(flex: 6),
              AppTextField(hintText: 'email@dominio.com'),
              Spacer(),
              AppTextField(hintText: '**************', obscureText: true),
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              ),
              Spacer(),
              AppElevatedButton(
                onPressed: () => print('primeiro botao'),
                buttonText: 'Entrar',
                type: ButtonType.filled,
              ),
              SizedBox(height: 17),
              AppElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  SignupPage.route,
                  arguments: 'vin',
                ),
                type: ButtonType.unfilled,
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
    );
  }
}
