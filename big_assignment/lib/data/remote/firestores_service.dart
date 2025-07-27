import 'package:big_assignment/data/models/firebase/fb_tiktok_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/firebase/fb_comment_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<FbTiktokModel>> getVideos() {
    return _firestore
        .collection('videos')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              debugPrint('doc.data(): ${doc.data()}');
              return FbTiktokModel.fromJson(doc.data());
            }).toList());
  }

  Future<void> getVideosId() async {
    QuerySnapshot snapshot = await _firestore.collection('videos').get();
    for (final document in snapshot.docs) {
      print(document.id);
      print(document.data());
    }
  }

  Stream<List<FbCommentModel>> getComments(String videoId) {
    return _firestore
        .collection('videos')
        .doc(videoId)
        .collection('comments')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => FbCommentModel.fromJson(doc.data()))
            .toList());
  }

  Future<void> updateVideo(FbTiktokModel video) async {
    await _firestore.collection('videos').doc(video.id).update(video.toJson());
  }

  Future<List<String>> getVideoIds() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('videos').get();
    List<String> videoIds = snapshot.docs.map((doc) => doc.id).toList();
    return videoIds;
  }

  Future<void> addComment(String videoId, FbCommentModel comment) async {
    await _firestore
        .collection('videos')
        .doc(videoId)
        .collection('comments')
        .add(comment.toJson());
  }
}
