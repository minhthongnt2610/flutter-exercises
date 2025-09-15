import 'package:flutter/cupertino.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auth_email_service.dart';

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
}
