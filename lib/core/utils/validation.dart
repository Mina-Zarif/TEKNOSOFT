abstract class Validation {
  static String? validateEmail(String value) {
    RegExp regex =
        RegExp(r"^[a-zA-Z\d.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z\d-]+.[a-zA-Z\d-]+$");
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please Enter Email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Please Enter Valid Email';
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please Enter Password';
    } else {
      if (value.length < 8) {
        return 'password length should be at least 8';
      } else if (RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.\d)[A-Za-z\d]{8,}$')
          .hasMatch(value)) {
        return 'password length should include special characters';
      } else if (RegExp(
              r'^(?=.[a-z])(?=.[A-Z])(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include numbers';
      } else if (RegExp(r'^(?=.[a-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include capital characters';
      } else if (RegExp(r'^(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
          .hasMatch(value)) {
        return 'password length should include small characters';
      } else {
        return null;
      }
    }
  }

  static String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    }
    return null;
  }
}
