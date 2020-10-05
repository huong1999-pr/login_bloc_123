class Validators {
  static isValidEmail(String email) {
    final regularExpression = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return regularExpression.hasMatch(email);
  }


  // kiểm tra định dạng email

  static isValidPassword(String password) => password.length >= 3;
}