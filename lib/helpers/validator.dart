class AppValidator {
  static enterText(String? value, String text) {
    if (value == null || value.isEmpty) {
      return "Please  enter $text";
    } else {
      return null;
    }
  }

  static numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Number";
    } else if (value.length < 10) {
      return "Please enter 10 digit Number";
    } else {
      return null;
    }
  }

  static otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter otp";
    } else if (value.length < 4) {
      return "Please enter 4 digit Number";
    } else {
      return null;
    }
  }
}
