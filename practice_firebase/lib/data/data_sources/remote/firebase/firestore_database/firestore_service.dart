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
  Stream<List<FriendModel>> getFriends() {
    return _firestore
        .collection("users")
        .doc("uid")
        .collection("friends")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FriendModel.fromJson(doc.data()))
              .toList(),
        );
  }

  //update
  Future<void> updateFriend(FriendModel friends) async {
    await _firestore
        .collection("users")
        .doc("uid")
        .collection("friends")
        .doc(friends.id.toString())
        .update(friends.toJson());
  }

  //delete
  Future<void> deleteFriend(int id) async {}
}
