import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:practice_firebase/models/friend_model.dart";

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  //create
  Future<void> addFriend(FriendModel friends) async {
    await _firestore
        .collection("users")
        .doc("uid")
        .collection("friends")
        .doc(friends.id.toString())
        .set(friends.toJson());
  }
  //get (Stream realtime)
  //update
  //delete
}
