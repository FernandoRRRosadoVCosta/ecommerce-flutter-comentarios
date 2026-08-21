import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  final RegExp _minimumLengthRegex = RegExp(r'^.{6,}$');
  final RegExp _uppercaseRegex = RegExp(r'^(?=.*[A-Z]).+$');
  final RegExp _lowercaseRegex = RegExp(r'^(?=.*[a-z]).+$');
  final RegExp _specialCharacterRegex = RegExp(
    r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool isActiveButton = false;

  bool isActiveCheckBox = false;
  String senha = '';

  String confirmarSenha = '';

  bool isLoading = false;

  Color cores = Colors.grey;
  bool get isSenhaCorrect => senha.isNotEmpty && senha == confirmarSenha;

  bool get isSenhaMinLength =>
      _minimumLengthRegex.hasMatch(senhaComtroller.text);
  bool get isSenhaUppercase => _uppercaseRegex.hasMatch(senhaComtroller.text);
  bool get isSenhaLowercase => _lowercaseRegex.hasMatch(senhaComtroller.text);
  bool get isSenhaSpecialCharacter =>
      _specialCharacterRegex.hasMatch(senhaComtroller.text);
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaComtroller = TextEditingController();
  TextEditingController senhacnfrmarComtrller = TextEditingController();

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
    print('isActiveCheckBox: $isActiveCheckBox');
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

  bool? validateSenhasCoincidem(String? value) {
    if (senha == confirmarSenha) {
      return null;
    }
    return false;
  }

  bool? validateMinimoCracteres(String? value) {
    if (_minimumLengthRegex.hasMatch(senha)) {
      return null;
    }
    return false;
  }

  bool? validateCaracteresEspecial(String? value) {
    if (_specialCharacterRegex.hasMatch(senha)) {
      return null;
    }
    return false;
  }

  bool? validateLetraMaiuscula(String? value) {
    if (_uppercaseRegex.hasMatch(senha)) {
      return null;
    }
    return false;
  }

  bool? validateLetraMinuscula(String? value) {
    if (_lowercaseRegex.hasMatch(senha)) {
      return null;
    }
    return false;
  }

  String? validatesenha(String? value) {
    // ignore: unrelated_type_equality_checks
    if (senha == validateLetraMinuscula &&
        senha == validateLetraMaiuscula &&
        senha == validateCaracteresEspecial &&
        senha == validateMinimoCracteres) {
      return null;
    }

    return 'Senha inválida';
  }

  Future<void> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
  }
}
