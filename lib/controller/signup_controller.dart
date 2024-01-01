import 'package:flutter/material.dart';
import 'package:mvc_app/constants/validation_mixin.dart';

class SignupController with FormValidation {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isPasswordFieldHidden = ValueNotifier(true);
  final ValueNotifier<bool> isConfirmPasswordFieldHidden = ValueNotifier(true);

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "This field is required";
    } else if (isValidEmail(email)) {
      return null;
    }
    return "Enter a valid email";
  }

  String? isValidPassword(String password) {
    if (password.isEmpty) {
      return "This field is required";
    } else if (isStrongPassword(password)) {
      return null;
    }
    return "Enter a password with atleast 5 characters";
  }

  void dispose() {
    confirmPasswordController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  Future<void> createAccount() async {
    if (globalKey.currentState!.validate()) {}
  }
}
