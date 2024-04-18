class Validator {
  String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
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
