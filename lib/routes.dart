import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/pages/login_page.dart';
import 'package:flutter_application_1/features/signup/pages/signup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
  };
}
