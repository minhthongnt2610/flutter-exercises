import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

import "../../../../../models/firebase/fb_friend_model.dart";

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  //create
  Future<void> addFriend(String userid, FbFriendModel addFriends) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .add(addFriends.toJson());
  }

  //get (Stream realtime)
  Stream<List<FbFriendModel>> getFriends(String userid) {
    return _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FbFriendModel.fromJson(doc.data(), doc.id))
              .toList(),
        );
  }

  //update
  Future<void> updateFriend(String userid, FbFriendModel updateFriends) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .doc(updateFriends.id.toString())
        .update(updateFriends.toJson());
  }

  //delete
  Future<void> deleteFriend(String id, String userid) async {
    await _firestore
        .collection("users")
        .doc(userid)
        .collection("friends")
        .doc(id)
        .delete();
  }
}
