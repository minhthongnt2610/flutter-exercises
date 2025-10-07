import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auths/auth_email_service.dart';


class LoginProvider extends ChangeNotifier {
  final _authEmailService = AuthEmailService();
  String? _email;
  String? _password;

  String? get email => _email;
  String? get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<String?> login() async {
    if (_email == null || _password == null) {
      return 'Please enter your email and password';
    }
    debugPrint("Login >> Email: $_email, Password: $_password");
    try {
      await _authEmailService.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
