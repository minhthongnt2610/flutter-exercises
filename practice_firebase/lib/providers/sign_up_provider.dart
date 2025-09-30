import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auths/auth_email_service.dart';

class SignUpProvider extends ChangeNotifier {
  final _authEmailService = AuthEmailService();
  String? _email;
  String? _password;
  String? _confirmPassword;

  String? get email => _email;
  String? get password => _password;
  String? get confirmPassword => _confirmPassword;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  Future<String?> signUp() async {
    if (_password != _confirmPassword) {
      return 'Password not match';
    }
    try {
      _authEmailService.signUpWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
