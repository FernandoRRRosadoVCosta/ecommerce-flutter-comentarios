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
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool get isSenhaCorrect =>
      senhaComtroller.text.isNotEmpty &&
      senhacnfrmarComtrller.text == senhacnfrmarComtrller.text;

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
    notifyListeners();
    changeActiveButton();
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    notifyListeners();
    changeActiveButton();
  }

  Future<void> signUp() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
    print('Cadastro realizado com sucesso');
  }

  void changeActiveButton() {
    isActiveButton =
        _uppercaseRegex.hasMatch(senha) &&
        _lowercaseRegex.hasMatch(senha) &&
        _specialCharacterRegex.hasMatch(senha) &&
        isSenhaMinLength &&
        isSenhaCorrect;
    notifyListeners();
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
    print('isActiveCheckBox: $isActiveCheckBox');
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(emailController.text)) {
      notifyListeners();
      return null;
    }
    notifyListeners();
    return 'E-mail inválido';
  }

  String? validateNome(String? value) {
    if (nomeController.text.isNotEmpty) {
      notifyListeners();
      return null;
    }
    notifyListeners();
    return 'Nome inválido';
  }

  String? validateSenha(String? value) {
    if (minSeisCaracteres &&
        possuiCaractereEspecial &&
        possuiLetraMaiuscula &&
        possuiLetraMinuscula) {
      notifyListeners();
      return null;
    }
    notifyListeners();
    return 'Senha não atende aos requisitos';
  }

  String? validateConfirmarSenha(String? value) {
    if (senhasCoincidentes) {
      notifyListeners();
      return null;
    }
    notifyListeners();
    return 'As senhas não coincidem';
  }

  bool get possuiLetraMaiuscula =>
      senhaComtroller.text.contains(RegExp(r'[A-Z]'));
  bool get possuiLetraMinuscula =>
      senhaComtroller.text.contains(RegExp(r'[a-z]'));
  bool get senhasCoincidentes =>
      senhaComtroller.text == senhacnfrmarComtrller.text &&
      senhaComtroller.text.isNotEmpty;
  bool get minSeisCaracteres => senhaComtroller.text.length >= 6;
  bool get possuiCaractereEspecial =>
      senhaComtroller.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  Future<void> handleSignup() async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      await signUp();
      isLoading = false;
      notifyListeners();
    }
  }
}
