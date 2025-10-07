import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
import 'package:practice_firebase/models/firebase/fb_user_model.dart';

import '../data/data_sources/remote/firebase/auths/auth_email_service.dart';

class UserProvider extends ChangeNotifier {
  final AuthEmailService _authEmailService;
  final FirestoreService _firestore = FirestoreService();
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
    FirebaseAuth.instance.userChanges().listen((user) async {
      _firebaseUser = user;
      _emailUser = user?.email;
      _nameUser = user?.displayName;
      _avatarUrl = user?.photoURL;

      if (user != null) {
        ///lấy dữ liệu tương ứng từ firestore
        final snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        ///nếu document đã tồn tại trong firestore
        if (snapshot.exists) {
          final fbUser = FbUserModel.fromJson(snapshot.data()!, snapshot.id);
          _nameUser = fbUser.nameUser;
          _avatarUrl = fbUser.photoUrl;
        } else {
          ///nếu user chưa tồn tại trên firestore => tạo mới
          final newUser = FbUserModel(
            id: user.uid,
            nameUser: _nameUser ?? "Unknown User",
            photoUrl: _avatarUrl ?? '',
          );

          /// Gọi FirestoreService để thêm document mới vào "users"
          await _firestore.addUser(user.uid, newUser);
        }
      }
      notifyListeners();
    });
  }

  void setAvatarFile(File file) {
    _avatarFile = file;
    _avatarUrl = null;
    notifyListeners();
  }

  Future<void> setAvatarUrl(String url) async {
    _avatarUrl = url;
    _avatarFile = null;
    notifyListeners();

    if (_firebaseUser != null) {
      final updateUser = FbUserModel(
        id: _firebaseUser!.uid,
        nameUser: _nameUser!,
        photoUrl: _avatarUrl!,
      );
      await _firestore.updateUser(_firebaseUser!.uid, updateUser);
    }
  }

  Future<void> setNameUser(String nameUser) async {
    _nameUser = nameUser;
    notifyListeners();
    if (_firebaseUser != null) {
      final updateUser = FbUserModel(
        id: _firebaseUser!.uid,
        nameUser: _nameUser!,
        photoUrl: _avatarUrl!,
      );
      await _firestore.updateUser(_firebaseUser!.uid, updateUser);
    }
  }

  void setEmailUser(String emailUser) {
    _emailUser = emailUser;
    notifyListeners();
  }

  // ======== HÀM ĐỒNG BỘ FIRESTORE → PROVIDER ======== //
  //khi khởi động lại app, hàm này tự động load từ firestore
  Future<void> fetchDataUser() async {
    //khi chua dang nhap
    if (_firebaseUser != null) return;
    //lay document
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_firebaseUser!.uid)
        .get();
    //nếu document đã tồn tại trong firestore
    if (doc.exists) {
      final fbUser = await FbUserModel.fromJson(doc.data()!, doc.id);
      _nameUser = fbUser.nameUser;
      _avatarUrl = fbUser.photoUrl;
      notifyListeners();
    }
  }
}
