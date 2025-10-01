import 'dart:io';

import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  String? _nameUser;
  File? _avatarFile;
  String? _avatarUrl;

  File? get avatarFile => _avatarFile;
  String? get avatarUrl => _avatarUrl;
  String? get nameUser => _nameUser;

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

  void setNameUser(String nameUser){
    _nameUser = nameUser;
    notifyListeners();
  }
}
