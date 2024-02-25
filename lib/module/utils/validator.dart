class Validator {
  String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }
    if (value.length != 10) {
      return "Enter a valid Phone Number";
    }
    return null;
  }

  String? emailValidator(String? value) {
    const String p = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (value!.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(p).hasMatch(value)) {
      return 'Incorrect email format';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }
    if (value.length < 6) {
      return "Password must be at least 5 character ";
    }
    return null;
  }

  String? confirmPasswordValidation(String? value1, String? value2) {
    if (value1 != value2) {
      return 'Password didn\'t matched';
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return "The field is required";
    }
    return null;
  }

  String? ageValidation(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    }
    if (int.parse(value) < 18 && int.parse(value) > 99) {
      return 'Age must be between 18 and 99';
    }
    return null;
  }
}
