import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

import "../../../../../models/firebase/fb_friend_model.dart";

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userid => _auth.currentUser!.uid;

  //create
  Future<void> addFriend(FbFriendModel addFriends) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .doc(addFriends.id.toString())
        .set(addFriends.toJson());
  }

  //get (Stream realtime)
  Stream<List<FbFriendModel>> getFriends() {
    return _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FbFriendModel.fromJson(doc.data()))
              .toList(),
        );
  }

  //update
  Future<void> updateFriend(FbFriendModel updateFriends) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .doc(updateFriends.id.toString())
        .update(updateFriends.toJson());
  }

  //delete
  Future<void> deleteFriend(int id) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .doc(id.toString())
        .delete();
  }
}
