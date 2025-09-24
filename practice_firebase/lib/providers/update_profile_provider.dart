import 'package:flutter/widgets.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final _firestoreService = FirestoreService();
  String? _name;
  DateTime? _birthday;
  String? _email;

  String? get name => _name;
  DateTime? get birthday => _birthday;
  String? get email => _email;

}
