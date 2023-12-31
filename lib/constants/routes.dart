import 'package:flutter/material.dart';
import 'package:mvc_app/constants/route_names.dart';
import 'package:mvc_app/view/default_page.dart';
import 'package:mvc_app/view/login_view.dart';
import 'package:mvc_app/view/signup_view.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RouteName.signupPage:
        return MaterialPageRoute(builder: (context) => const SignupPage());
      default:
        return MaterialPageRoute(builder: (context) => const DefaultPage());
    }
  }
}