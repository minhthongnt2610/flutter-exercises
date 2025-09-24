import 'package:flutter/widgets.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
import 'package:practice_firebase/models/friend_model.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final _firestoreService = FirestoreService();
  String? _name;
  DateTime? _birthday;
  String? _email;

  String? get name => _name;
  DateTime? get birthday => _birthday;
  String? get email => _email;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setBirthday(DateTime value) {
    _birthday = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  Future<String?> updateProfile() async {
    try {
      _firestoreService.updateFriend(
        FriendModel(id: 1, name: _name, birthdate: _birthdate, email: _email),
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
