import 'package:flutter/material.dart';

class SignupController {
  final RegExp _minimumLengthRegex = RegExp(r'^.{6,}$');
  final RegExp _uppercaseRegex = RegExp(r'^(?=.*[A-Z]).+$');
  final RegExp _lowercaseRegex = RegExp(r'^(?=.*[a-z]).+$');
  final RegExp _specialCharacterRegex = RegExp(
    r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool isActiveButton = false;

  bool isActiveCheckBox = false;

  String email = '';

  String nome = '';

  String senha = '';

  String confirmarSenha = '';

  bool isLoading = false;

  Color cores = Colors.grey;
  bool get isSenhaCorrect => senha.isNotEmpty && senha == confirmarSenha;
  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaMinLength => _minimumLengthRegex.hasMatch(senha);
  bool get isSenhaUppercase => _uppercaseRegex.hasMatch(senha);
  bool get isSenhaLowercase => _lowercaseRegex.hasMatch(senha);
  bool get isSenhaSpecialCharacter => _specialCharacterRegex.hasMatch(senha);
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    changeActiveButton();
  }

  // void setCores(bool coresParam, bool isActiveCheckBoxParam) {
  //   if (isActiveCheckBoxParam) {
  //     cores = Colors.red;
  //   } else {
  //     cores = Colors.green;
  //   }
  // }

  void changeActiveButton() {
    isActiveButton =
        _uppercaseRegex.hasMatch(senha) &&
        _lowercaseRegex.hasMatch(senha) &&
        _specialCharacterRegex.hasMatch(senha) &&
        isSenhaMinLength &&
        isSenhaCorrect;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(emailController.text)) {
      return null;
    }
    return 'E-mail inválido';
  }

  String? validateNome(String? value) {
    if (nomeController.text.isNotEmpty) {
      return null;
    }
    return 'Nome inválido';
  }

  Future<void> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
  }
}
