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
    _firebaseUser = _authEmailService.currentUser;

    // Lắng nghe sự thay đổi đăng nhập
    FirebaseAuth.instance.userChanges().listen((user) async {
      _firebaseUser = user;
      _emailUser = user?.email;
      _nameUser = user?.displayName;
      _avatarUrl = user?.photoURL;

      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          final fbUser = FbUserModel.fromJson(snapshot.data()!, snapshot.id);
          _nameUser = fbUser.nameUser;
          _avatarUrl = fbUser.photoUrl;
        } else {
          // Tạo document mới nếu chưa có
          final newUser = FbUserModel(
            id: user.uid,
            nameUser: _nameUser ?? "Unknown User",
            photoUrl: _avatarUrl ?? '',
          );
          await _firestore.addUser(user.uid, newUser);
        }
      }
      notifyListeners();
    });
  }

  // Cập nhật ảnh từ file cục bộ (chưa upload)
  Future<void> setAvatarFile(File file) async {
    if (_firebaseUser == null) return;
    _avatarFile = file;
    _avatarUrl = file.path;
    notifyListeners();

    try {


      final updateUser = FbUserModel(
        id: _firebaseUser!.uid,
        nameUser: _nameUser ?? 'Unknown User',
        photoUrl: _avatarUrl!,
      );
      await _firestore.updateUser(_firebaseUser!.uid, updateUser);
      debugPrint("✅ Avatar updated successfully: $_avatarUrl");

    } catch (e) {
      debugPrint("❌ Error updating avatar: $e");
    }
  }

  // Cập nhật URL ảnh đã upload lên Firebase Storage
  Future<void> setAvatarUrl(String url) async {
    if (_firebaseUser == null) return;

    _avatarUrl = url;
    _avatarFile = null;
    notifyListeners();

    try {
      // ✅ Cập nhật FirebaseAuth profile
      await _firebaseUser!.updatePhotoURL(url);
      await _firebaseUser!.reload();
      _firebaseUser = FirebaseAuth.instance.currentUser;

      // ✅ Cập nhật Firestore
      final updateUser = FbUserModel(
        id: _firebaseUser!.uid,
        nameUser: _nameUser ?? "Unknown User",
        photoUrl: _avatarUrl ?? '',
      );
      await _firestore.updateUser(_firebaseUser!.uid, updateUser);

      debugPrint("✅ Avatar updated successfully: $_avatarUrl");
    } catch (e) {
      debugPrint("❌ Error updating avatar: $e");
    }
  }

  // Cập nhật tên người dùng
  Future<void> setNameUser(String nameUser) async {
    if (_firebaseUser == null) return;

    _nameUser = nameUser;
    notifyListeners();

    try {
      // ✅ Cập nhật FirebaseAuth displayName
      await _firebaseUser!.updateDisplayName(nameUser);
      await _firebaseUser!.reload();
      _firebaseUser = FirebaseAuth.instance.currentUser;

      // ✅ Cập nhật Firestore
      final updateUser = FbUserModel(
        id: _firebaseUser!.uid,
        nameUser: _nameUser ?? 'Unknown User',
      );
      await _firestore.updateUser(_firebaseUser!.uid, updateUser);

      debugPrint("✅ Name updated successfully: $_nameUser");
    } catch (e) {
      debugPrint("❌ Error updating name: $e");
    }
  }

  void setEmailUser(String emailUser) {
    _emailUser = emailUser;
    notifyListeners();
  }

  // ======== Load dữ liệu Firestore → Provider ======== //
  Future<void> fetchDataUser() async {
    if (_firebaseUser == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_firebaseUser!.uid)
        .get();

    if (doc.exists) {
      final fbUser = FbUserModel.fromJson(doc.data()!, doc.id);
      _nameUser = fbUser.nameUser;
      _avatarUrl = fbUser.photoUrl;

      notifyListeners();
    }
  }
}
