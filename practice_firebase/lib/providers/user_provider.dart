import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../data/data_sources/remote/firebase/auths/auth_email_service.dart';

class UserProvider extends ChangeNotifier {
  final AuthEmailService _authEmailService;
  User? _firebaseUser;
  String? _nameUser;
  File? _avatarFile;
  String? _avatarUrl;
  String? _emailUser;

  User? get firebaseUser => _firebaseUser;
  File? get avatarFile => _avatarFile;
  String? get avatarUrl => _avatarUrl;
  String? get nameUser => _nameUser;
  String? get emailUser => _emailUser;

  UserProvider(this._authEmailService) {
    // Khởi tạo user ngay lần đầu
    _firebaseUser = _authEmailService.currentUser;

    // Lắng nghe sự thay đổi đăng nhập
    FirebaseAuth.instance.userChanges().listen((user) {
      _firebaseUser = user;
      _emailUser = user?.email;
      _nameUser = user?.displayName;
      _avatarUrl = user?.photoURL;
      notifyListeners();
    });
  }


  void setAvatarFile(File file) {
    _avatarFile = file;
    _avatarUrl = null;
    notifyListeners();
  }

  void setAvatarUrl(String url) {
    _avatarUrl = url;
    _avatarFile = null;
    notifyListeners();
  }

  void setNameUser(String nameUser) {
    _nameUser = nameUser;
    notifyListeners();
  }

  void setEmailUser(String emailUser) {
    _emailUser = emailUser;
    notifyListeners();
  }
}
