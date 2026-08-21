import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/widget/app_check_box.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_password_validation.dart';
import 'package:flutter_application_1/features/signup/controllers/signup_controller.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  static String route = '/signup';
  SignupPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Consumer<SignupController>(
            builder: (context, controller, child) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      constraints.maxHeight -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: controller.key,
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

                          AppTextField(
                            controller: controller.emailController,
                            hintText: 'email@dominio.com',
                            validator: (value) {
                              return controller.validateEmail(value);
                            },
                          ),
                          AppTextField(
                            controller: controller.nomeController,
                            hintText: 'nome',
                            validator: (value) {
                              return controller.validateNome(value);
                            },
                          ),
                          AppTextField(
                            controller: controller.senhaComtroller,

                            validator: (value) {
                              return controller.validateSenha(value);
                            },
                            hintText: 'senha',
                            obscureText: true,
                          ),
                          AppTextField(
                            controller: controller.senhacnfrmarComtrller,

                            validator: (value) {
                              return controller.validateConfirmarSenha(value);
                            },

                            hintText: 'confimar senha',
                            obscureText: true,
                          ),
                          AppPasswordValidation(
                            isValid: controller.isSenhaMinLength,
                            label: "Mínimo de 6 caracteres",
                          ),
                          AppPasswordValidation(
                            isValid: controller.isSenhaSpecialCharacter,
                            label: 'No mínimo um caracteres especial',
                          ),
                          AppPasswordValidation(
                            isValid: controller.isSenhaUppercase,
                            label: 'No mínimo uma letra maiuscula',
                          ),
                          AppPasswordValidation(
                            isValid: controller.isSenhaLowercase,
                            label: 'No mínimo uma letra minuscula',
                          ),
                          AppPasswordValidation(
                            isValid: controller.isSenhaCorrect,
                            label: 'As senhas coincidem',
                          ),

                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              print('CLIQUEI NA LINHA');
                            },
                            child: Row(
                              children: [
                                AppCheckBox(
                                  value: controller.isActiveCheckBox,
                                  onChanged: (value) {
                                    controller.changeActiveCheckBox();
                                  },
                                ),
                                RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Ao clicar em continuar, você concorda com\nnossos Termos de uso e Política de Privacidade',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          AppElevatedButton(
                            buttonText: 'Continuar',
                            isLoading: controller.isLoading,
                            onPressed: () {
                              controller.handleSignup();
                            },
                            type: ButtonType.filled,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
