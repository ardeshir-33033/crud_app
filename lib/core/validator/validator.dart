abstract class Validator {
  bool validateEmail(String email);
  bool validateAccount(String account);
}

class ValidatorImpl implements Validator {
  @override
  bool validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return email.length >= 5 && emailValid;
  }

  @override
  bool validateAccount(String account) {
    return account.length >= 8 && double.tryParse(account) != null;
  }
}
