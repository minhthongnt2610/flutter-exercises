// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
// import 'package:practice_firebase/models/firebase/fb_user_model.dart';
// import '../data/data_sources/remote/firebase/auths/auth_email_service.dart';
//
// class UserProvider extends ChangeNotifier {
//   final AuthEmailService _authEmailService;
//   final FirestoreService _firestore = FirestoreService();
//   User? _firebaseUser;
//   String? _nameUser;
//   File? _avatarFile;
//   String? _avatarUrl;
//   String? _emailUser;
//
//   User? get firebaseUser => _firebaseUser;
//   File? get avatarFile => _avatarFile;
//   String? get avatarUrl => _avatarUrl;
//   String? get nameUser => _nameUser;
//   String? get emailUser => _emailUser;
//
//   UserProvider(this._authEmailService) {
//     _firebaseUser = _authEmailService.currentUser;
//
//     // Lắng nghe sự thay đổi đăng nhập
//     FirebaseAuth.instance.userChanges().listen((user) async {
//       _firebaseUser = user;
//       _emailUser = user?.email;
//       _nameUser = user?.displayName;
//       _avatarUrl = user?.photoURL;
//
//       if (user != null) {
//         final snapshot = await FirebaseFirestore.instance
//             .collection("users")
//             .doc(user.uid)
//             .get();
//
//         if (snapshot.exists) {
//           final fbUser = FbUserModel.fromJson(snapshot.data()!, snapshot.id);
//           _nameUser = fbUser.nameUser;
//           _avatarUrl = fbUser.photoUrl;
//         } else {
//           // Tạo document mới nếu chưa có
//           final newUser = FbUserModel(
//             id: user.uid,
//             nameUser: _nameUser ?? "Unknown User",
//             photoUrl: _avatarUrl ?? '',
//           );
//           await _firestore.addUser(user.uid, newUser);
//         }
//       }
//       notifyListeners();
//     });
//   }
//
//   // Cập nhật ảnh từ file cục bộ (chưa upload)
//   Future<void> setAvatarFile(File file) async {
//     // if (_firebaseUser == null) return;
//     // _avatarFile = file;
//     // _avatarUrl = file.path;
//     // notifyListeners();
//     // try {
//     //   await _firestore.updateUser(_firebaseUser!.uid, {
//     //     'photoUrl': _avatarUrl,
//     //   });
//     //   debugPrint("✅ Avatar updated successfully: $_avatarUrl");
//     //
//     // } catch (e) {
//     //   debugPrint("❌ Error updating avatar: $e");
//     // }
//
//     debugPrint("HÀM NÀY ĐƯỢC GỌI");
//   }
//
//   // Cập nhật URL ảnh đã upload lên Firebase Storage
//   Future<void> setAvatarUrl(String url) async {
//     if (_firebaseUser == null) return;
//
//     _avatarUrl = url;
//     _avatarFile = null;
//     notifyListeners();
//
//     try {
//       await _firestore.updateUser(_firebaseUser!.uid, {'photoUrl': _avatarUrl});
//
//       debugPrint("✅ Avatar updated successfully: $_avatarUrl");
//       debugPrint("HÀM NÀY ĐƯỢC GỌI");
//     } catch (e) {
//       debugPrint("❌ Error updating avatar: $e");
//     }
//   }
//
//   // Cập nhật tên người dùng
//   Future<void> setNameUser(String nameUser) async {
//     if (_firebaseUser == null) return;
//
//     _nameUser = nameUser;
//     notifyListeners();
//
//     try {
//       // ✅ Cập nhật FirebaseAuth displayName
//       await _firebaseUser!.updateDisplayName(nameUser);
//       await _firebaseUser!.reload();
//       _firebaseUser = FirebaseAuth.instance.currentUser;
//
//       await _firestore.updateUser(_firebaseUser!.uid, {'nameUser': _nameUser});
//
//       debugPrint("✅ Name updated successfully: $_nameUser");
//     } catch (e) {
//       debugPrint("❌ Error updating name: $e");
//     }
//   }
//
//   void setEmailUser(String emailUser) {
//     _emailUser = emailUser;
//     notifyListeners();
//   }
//
//   // ======== Load dữ liệu Firestore → Provider ======== //
//   Future<void> fetchDataUser() async {
//     if (_firebaseUser == null) return;
//
//     final doc = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(_firebaseUser!.uid)
//         .get();
//
//     if (doc.exists) {
//       final fbUser = FbUserModel.fromJson(doc.data()!, doc.id);
//       _nameUser = fbUser.nameUser;
//       _avatarUrl = fbUser.photoUrl;
//
//       notifyListeners();
//     }
//   }
// }
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
  bool _isLoading = false; // Thêm trạng thái loading

  User? get firebaseUser => _firebaseUser;
  File? get avatarFile => _avatarFile;
  String? get avatarUrl => _avatarUrl;
  String? get nameUser => _nameUser;
  String? get emailUser => _emailUser;
  bool get isLoading => _isLoading; // Getter cho trạng thái loading

  UserProvider(this._authEmailService) {
    // Chỉ lắng nghe sự thay đổi người dùng, sau đó gọi một hàm riêng để xử lý logic
    FirebaseAuth.instance.userChanges().listen(_onUserChanged);
    // Chủ động lấy dữ liệu cho người dùng hiện tại khi provider được khởi tạo
    _onUserChanged(_authEmailService.currentUser);
  }

  // Hàm riêng xử lý logic khi có sự thay đổi về User
  Future<void> _onUserChanged(User? user) async {
    if (user == null) {
      // Nếu người dùng đăng xuất
      _firebaseUser = null;
      _nameUser = null;
      _avatarUrl = null;
      _emailUser = null;
      notifyListeners(); // Thông báo ngay lập tức để UI cập nhật (ví dụ: chuyển về màn hình đăng nhập)
      return;
    }

    // Nếu người dùng không thay đổi, không cần làm gì cả
    if (user.uid == _firebaseUser?.uid && _nameUser != null) return;

    _firebaseUser = user;
    _setLoading(true); // Bắt đầu quá trình tải dữ liệu

    // Lấy dữ liệu chi tiết từ Firestore
    final snapshot = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

    if (snapshot.exists) {
      final fbUser = FbUserModel.fromJson(snapshot.data()!, snapshot.id);
      _nameUser = fbUser.nameUser;
      _avatarUrl = fbUser.photoUrl;
      _emailUser = user.email; // Giữ email từ Firebase Auth
    } else {
      // Nếu không có document, tạo mới với thông tin từ Auth
      _nameUser = user.displayName ?? "Unknown User";
      _avatarUrl = user.photoURL ?? '';
      _emailUser = user.email;

      final newUser = FbUserModel(
        id: user.uid,
        nameUser: _nameUser!,
        photoUrl: _avatarUrl!,
      );
      await _firestore.addUser(user.uid, newUser);
    }

    _setLoading(false); // Kết thúc quá trình tải, và gọi notifyListeners()
  }

  // Hàm helper để quản lý trạng thái loading và thông báo cho listeners
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Cập nhật URL ảnh đã upload lên Firebase Storage
  Future<void> setAvatarUrl(String url) async {
    if (_firebaseUser == null) return;

    try {
      await _firestore.updateUser(_firebaseUser!.uid, {'photoUrl': url});
      _avatarUrl = url;
      _avatarFile = null;
      notifyListeners(); // Chỉ gọi sau khi tất cả thành công
      debugPrint("✅ Avatar updated successfully: $url");
    } catch (e) {
      debugPrint("❌ Error updating avatar: $e");
    }
  }

  // Cập nhật tên người dùng
  Future<void> setNameUser(String nameUser) async {
    if (_firebaseUser == null) return;

    try {
      // Cập nhật song song cả Auth và Firestore
      await Future.wait([
        _firebaseUser!.updateDisplayName(nameUser),
        _firestore.updateUser(_firebaseUser!.uid, {'nameUser': nameUser})
      ]);

      _nameUser = nameUser;
      notifyListeners(); // Cập nhật UI sau khi logic thành công
      debugPrint("✅ Name updated successfully: $nameUser");
    } catch (e) {
      debugPrint("❌ Error updating name: $e");
    }
  }

// Các hàm khác giữ nguyên...
// setEmailUser không cần thiết nữa vì đã được xử lý trong _onUserChanged
}
