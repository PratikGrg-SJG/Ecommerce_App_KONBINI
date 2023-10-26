class FormValidator {
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter username";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email address";
    }
    if (!value.contains("@gmail.com")) {
      return "Enter valid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    // Additional checks for password strength
    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigits = value.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return "Password must contain at least one uppercase letter";
    }
    if (!hasLowercase) {
      return "Password must contain at least one lowercase letter";
    }
    if (!hasDigits) {
      return "Password must contain at least one digit";
    }
    if (!hasSpecialCharacters) {
      return "Password must contain at least one special character";
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
