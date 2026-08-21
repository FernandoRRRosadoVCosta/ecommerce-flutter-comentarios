import 'package:flutter/material.dart';

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

  Future<void> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
    print('Login realizado com sucesso');
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

  Future<void> handleLogin() async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      await login();
      print('Executei o login do controller');

      isLoading = false;
      notifyListeners();
    }
  }
}
