import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String caption;
  final String uid;
  final String postId;
  final String username;
  final String postUrl;
  final String profilePic;
  final List likes;
  final DateTime postDate;
  const Post({
    required this.caption,
    required this.uid,
    required this.postId,
    required this.username,
    required this.postDate,
    required this.postUrl,
    required this.profilePic,
    required this.likes,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "caption": caption,
        "postId": postId,
        "postDate": postDate,
        "postUrl": postUrl,
        "profilePic": profilePic,
        "likes": likes
      };
  static Post fromJson(Map<String, dynamic> snapShot) {
    // final snapShot = snap.data() as Map<String, dynamic>;
    Timestamp t = snapShot['postDate'];
    DateTime postDate = t.toDate();
    return Post(
      caption: snapShot["caption"],
      uid: snapShot["uid"],
      postId: snapShot["postId"],
      username: snapShot["username"],
      postDate: postDate,
      postUrl: snapShot["postUrl"],
      profilePic: snapShot["profilePic"],
      likes: snapShot["likes"],
    );
  }
}
