import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';

class SignupPage extends StatelessWidget {
  static String route = '/signup';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20,
            children: [
              Column(
                spacing: 2,
                children: [
                  Text('Cria uma conta', style: AppTextStyle.title),
                  Text(
                    'Insira seus dados para inicicar suas compras',
                    style: AppTextStyle.corpoTitle,
                  ),
                ],
              ),

              AppTextField(hintText: 'email@dominio.com'),
              AppTextField(hintText: 'nome'),
              AppTextField(hintText: 'senha'),
              AppTextField(hintText: 'confimar senha'),
              Spacer(),
              Column(
                spacing: 5,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('CLIQUEI NA LINHA');
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ao clicar em continuar, você concorda com nossos ',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),

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
                            text: 'e com',
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
                ],
              ),
              AppElevatedButton(
                onPressed: () => print('primeiro botao'),
                buttonText: 'Continuar',
                type: ButtonType.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
