import 'package:firebase_auth/firebase_auth.dart';

class AuthEmailService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //đăng ký email và password
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if(user != null){
        //tra ve Auth Share Pref
        //await await AuthSharedPrefs.saveUid(user.uid);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      //tạm thời
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }

      ///thêm _handleError viết sau
    }
  }

  //đăng nhập bằng email và password
  //đăng xuất
  //xử lý lỗi firebase auth
}
