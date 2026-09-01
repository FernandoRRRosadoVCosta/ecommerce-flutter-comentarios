import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/model/user.dart';
import 'package:flutter_application_1/shared/exceptions/auth_exception.dart';

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _minimumLengthRegex = RegExp(r'^.{6,}$');
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;
  bool isActiveCheckbox = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid =>
      _minimumLengthRegex.hasMatch(senhaController.text.trim());
  User? user;
  Future<void> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
    if (emailController.text.trim() != 'gabriel@gmail.com' ||
        senhaController.text.trim() != '122333') {
      throw AuthException('E-mail ou senha incorretos');
    }
    user = User(nome: 'Vitor', email: emailController.text);
  }

  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(emailController.text)) {
      return null;
    }
    return 'E-mail inválido';
  }

  String? validateSenha(String? value) {
    if (senhaController.text.length >= 6) {
      return null;
    }
    return 'Senha inválido';
  }

  void changeActiveCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('validacao_incorreta');
    }

    changeIsLoading(true);
    try {
      await login();
      emailController.clear();
      senhaController.clear();
    } finally {
      changeIsLoading(false);
    }
  }
}
