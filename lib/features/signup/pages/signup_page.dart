import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_text_style.dart';
import 'package:flutter_application_1/shared/widget/app_check_box.dart';
import 'package:flutter_application_1/shared/widget/app_text_field.dart';
import 'package:flutter_application_1/shared/widget/app_elevated_button.dart';
import 'package:flutter_application_1/shared/widget/app_password_validation.dart';
import 'package:flutter_application_1/features/signup/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  static String route = '/signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController signupController = SignupController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  initState() {
    super.initState();
  }

  Future<void> _handleSignup() async {
    if (key.currentState!.validate()) {
      setState(() {
        signupController.isLoading = true;
      });

      await signupController.login();
      setState(() {
        signupController.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  constraints.maxHeight - MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: key,
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
                        controller: signupController.emailController,
                        hintText: 'email@dominio.com',
                        validator: (value) {
                          return signupController.validateEmail(value);
                        },
                      ),
                      AppTextField(
                        controller: signupController.nomeController,
                        hintText: 'nome',
                        validator: (value) {
                          return signupController.validateNome(value);
                        },
                      ),
                      AppTextField(
                        controller: signupController.senhaComtroller,
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          return signupController.validatesenha(value);
                        },
                        hintText: 'senha',
                        obscureText: true,
                      ),
                      AppTextField(
                        onChanged: (value) {
                          setState(() {
                            signupController.setConfirmarSenha(value);
                          });
                        },
                        hintText: 'confimar senha',
                        obscureText: true,
                      ),
                      AppPasswordValidation(
                        isValid: signupController.isSenhaMinLength,
                        label: "Mínimo de 6 caracteres",
                      ),
                      AppPasswordValidation(
                        isValid: signupController.isSenhaSpecialCharacter,
                        label: 'No mínimo um caracteres especial',
                      ),
                      AppPasswordValidation(
                        isValid: signupController.isSenhaUppercase,
                        label: 'No mínimo uma letra maiuscula',
                      ),
                      AppPasswordValidation(
                        isValid: signupController.isSenhaLowercase,
                        label: 'No mínimo uma letra minuscula',
                      ),
                      AppPasswordValidation(
                        isValid: signupController.isSenhaCorrect,
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
                              value: signupController.isActiveCheckBox,
                              onChanged: (value) {
                                setState(() {
                                  signupController.changeActiveCheckBox();
                                });
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
                        isLoading: signupController.isLoading,
                        onPressed: () {
                          _handleSignup();
                        },
                        type: ButtonType.filled,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
