mixin FormValidation {
  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
    return emailRegex.hasMatch(email);
  }

  bool isStrongPassword(String password) {
    if (password.length > 5) {
      return true;
    }
    return false;
  }
}
