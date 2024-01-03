import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_app/constants/validation_mixin.dart';
import 'package:mvc_app/constants/constants.dart';
import 'package:mvc_app/utils/toast_message.dart';

class ForgotPasswordController with ChangeNotifier, FormValidation {
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  void _changeStatus(bool newStatus) {
    _isLoading = newStatus;
    notifyListeners();
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "This field is required";
    } else if (isValidEmail(email)) {
      return null;
    }
    return "Invalid email";
  }

  Future<void> sendResetLink(
      String email, GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate()) {
      _changeStatus(true);
      try {
        FirebaseConstants.firebaseAuth
            .sendPasswordResetEmail(email: email)
            .timeout(
              const Duration(
                seconds: 10,
              ),
            )
            .then(
          (value) {
            _changeStatus(false);
            showToastMessage("Reset email sent!");
          },
        ).onError(
          (error, stackTrace) {
            _changeStatus(false);
            if (error is FirebaseAuthException) {
              showToastMessage(error.message.toString());
              return;
            }
            showToastMessage(error.toString());
            return;
          },
        );
      } on SocketException {
        _changeStatus(false);
        showToastMessage("No internet");
      } on TimeoutException {
        _changeStatus(false);
        showToastMessage("Server request timeout");
      }
    }
  }
}
