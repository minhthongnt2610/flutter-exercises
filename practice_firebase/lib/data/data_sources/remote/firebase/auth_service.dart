import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSignedIn(){
    return _auth.currentUser != null ? true : false;

  }
}