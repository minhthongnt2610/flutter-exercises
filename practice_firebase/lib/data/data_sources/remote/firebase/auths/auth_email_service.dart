import 'package:firebase_auth/firebase_auth.dart';
import 'auth_shared_prefs.dart';

class AuthEmailService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  bool isSignedIn() {
    return currentUser != null;
  }
  bool isUpdateProfile(){
    return (currentUser?.displayName?.isNotEmpty ?? false) &&(
        currentUser?.photoURL?.isNotEmpty ?? false);

  }

  //register with email and password
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        ///return Auth Share Pref
        await AuthSharedPrefs.saveUid(user.uid);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      ///add _handleError
      throw Exception(_handleError(e));
    }
  }

  //sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        ///return Auth Share Pref
        await AuthSharedPrefs.saveUid(user.uid);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      ///add _handleError
      throw Exception(_handleError(e));
    }
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();

    ///return Auth Share Pref
    await AuthSharedPrefs.clearUid();
  }

  ///send email to reset password
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //FirebaseAuth Error Handling
  String _handleError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Your email address appears to be malformed.';
      case 'user-disable':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'This user does not exist.';
      case 'wrong-password':
        return 'Your password is wrong.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'Your password is too weak.';
      default:
        return 'Something went wrong.';
    }
  }
}
