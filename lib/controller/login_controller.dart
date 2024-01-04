import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_app/constants/constants.dart';
import 'package:mvc_app/constants/route_names.dart';
import 'package:mvc_app/constants/validation_mixin.dart';
import 'package:mvc_app/utils/toast_message.dart';

class LoginController with FormValidation, ChangeNotifier {
  bool _isLoading = false;

  bool get getisLoading => _isLoading;

  void _changeStatus(bool newStatus) {
    _isLoading = newStatus;
    notifyListeners();
  }

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

  Future<void> login({
    required Map<String, String> loginDetails,
    required GlobalKey<FormState> globalKey,
    required BuildContext context,
  }) async {
    if (globalKey.currentState!.validate()) {
      _changeStatus(true);

      FirebaseConstants.firebaseAuth
          .signInWithEmailAndPassword(
        email: loginDetails["email"]!,
        password: loginDetails["password"]!,
      )
          .then((value) {
        showToastMessage("Login Sucess");
        _changeStatus(false);
        Navigator.pushReplacementNamed(
          context,
          RouteName.homePage,
        );

        debugPrint("Login Sucess");
      }).onError((error, stackTrace) {
        _changeStatus(false);
        if (error is FirebaseException) {
          showToastMessage(error.message!);
          return;
        }
        showToastMessage(error.toString());
      });
    }
  }
}
