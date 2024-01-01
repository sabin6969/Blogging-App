import 'package:flutter/material.dart';
import 'package:mvc_app/constants/constants.dart';
import 'package:mvc_app/constants/validation_mixin.dart';

class LoginController with FormValidation {
  final FirebaseConstants _firebaseConstants = FirebaseConstants();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> isPasswordVissible = ValueNotifier(true);

  // method to check wheather email is valid or not
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "This field is required";
    } else if (isValidEmail(email)) {
      return null;
    }
    return "Enter a valid email";
  }

  // method to check wheather password is strong or not
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "This field is required";
    } else if (isStrongPassword(password)) {
      return null;
    }
    return "Enter a password with atleast 5 character";
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
