import 'package:flutter/widgets.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';

import '../models/firebase/fb_friend_model.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final _firestoreService = FirestoreService();
  String? _name;
  int? _birthday;
  String? _email;
  String? _nameUser;

  String? get name => _name;
  int? get birthday => _birthday;
  String? get email => _email;
  String? get nameUser => _nameUser;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setBirthday(int value) {
    _birthday = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
  void setNameUser(String value){
    _nameUser = value;
    notifyListeners();
  }
  Future<String?> updateProfile() async {
    try {
      _firestoreService.updateFriend(
        FbFriendModel(name: _name!, birthdate: _birthday!, email: _email!, nameUser: ''),
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
