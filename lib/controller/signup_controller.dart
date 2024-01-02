import 'package:flutter/material.dart';
import 'package:mvc_app/constants/validation_mixin.dart';
import 'package:mvc_app/constants/constants.dart';

class SignupController with FormValidation, ChangeNotifier {
  bool _isLoading = false;

  void _changeStatus(bool newStatus) {
    _isLoading = newStatus;
    notifyListeners();
  }

  bool get getIsLoading => _isLoading;

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

  Future<void> createAccount(
      {required Map<String, String> signupDetails,
      required GlobalKey<FormState> globalKey}) async {
    if (globalKey.currentState!.validate()) {
      if (signupDetails["password"]!
              .compareTo(signupDetails["confirmPassword"]!) !=
          0) return;

      _changeStatus(true);
      FirebaseConstants.firebaseAuth
          .createUserWithEmailAndPassword(
        email: signupDetails["email"]!,
        password: signupDetails["password"]!,
      )
          .then(
        (value) {
          debugPrint("account created");
          _changeStatus(false);
        },
      ).onError(
        (error, stackTrace) {
          debugPrint("account created");
          _changeStatus(false);
        },
      );
    }
  }
}
