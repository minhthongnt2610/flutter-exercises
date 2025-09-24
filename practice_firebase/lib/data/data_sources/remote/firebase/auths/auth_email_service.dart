import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/info_dialog.dart';
import 'auth_shared_prefs.dart';

class AuthEmailService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
  Future<User?> signInWithEmailAnhPassword({
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
