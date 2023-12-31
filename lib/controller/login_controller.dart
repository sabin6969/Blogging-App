import 'package:flutter/material.dart';
import 'package:mvc_app/constants/constants.dart';

class LoginController {
  final FirebaseConstants _firebaseConstants = FirebaseConstants();

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;

  LoginController({
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
  });

  // method to check wheather email is valid or not
  String? validateEmail(String email) {
    if (isValidEmail(email)) {
      return null;
    }
    return "Enter a valid email";
  }

  // method to check wheather password is strong or not
  String? validatePassword(String password) {
    if (isStrongPassword(password)) {
      return null;
    }
    return "Enter a password atleast with 6 characters";
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
    return emailRegex.hasMatch(email);
  }

  bool isStrongPassword(String password) {
    if (password.length >= 6) {
      return true;
    }
    return false;
  }

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    if (globalKey.currentState!.validate()) {
      _firebaseConstants.firebaseAuth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("Login Sucess");
      }).onError((error, stackTrace) {
        debugPrint("an error occured");
        debugPrint(error.toString());
      });
    }
  }
}
