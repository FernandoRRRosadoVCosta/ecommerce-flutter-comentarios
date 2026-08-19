class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final int _carecterMinimoSenha = 6;
  bool isActiveCheckBox = false;
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => senha.trim().length >= _carecterMinimoSenha;
  bool isLoading = false;

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;
    return 'E-mail inválido';
  }

  String? get senhaError {
    if (senha.isEmpty || isSenhaValid) return null;
    return "senha inválida";
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<void> login() async {
    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));
    print('Login realizado com sucesso');
  }

  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(email)) {
      return null;
    }
    return 'E-mail inválido';
  }
}
