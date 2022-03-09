import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String caption;
  final String uid;
  final String postId;
  final String username;
  // final DateTime datePublishd;
  final String postUrl;
  final String profilePic;
  final likes;
  const Post({
    required this.caption,
    required this.uid,
    required this.postId,
    required this.username,
    // required this.datePublishd,
    required this.postUrl,
    required this.profilePic,
    required this.likes,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "caption": caption,
        "postId": postId,
        // "datePublishd": datePublishd,
        "postUrl": postUrl,
        "profilePic": profilePic,
        "likes": likes
      };
  static Post fromJson(Map<String, dynamic> snapShot) {
    // final snapShot = snap.data() as Map<String, dynamic>;
    return Post(
        caption: snapShot["caption"],
        uid: snapShot["uid"],
        postId: snapShot["postId"],
        username: snapShot["username"],
        // datePublishd: snapShot["datePublishd"],
        postUrl: snapShot["postUrl"],
        profilePic: snapShot["profilePic"],
        likes: snapShot["likes"]);
  }
}
