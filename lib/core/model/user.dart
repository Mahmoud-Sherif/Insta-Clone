import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String uid;
  final String imageUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  const UserData({
    required this.email,
    required this.uid,
    required this.imageUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "imageUrl": imageUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
  static UserData fromJson(DocumentSnapshot snap) {
    final snapShot = snap.data() as Map<String, dynamic>;
    return UserData(
      email: snapShot["email"],
      uid: snapShot["uid"],
      imageUrl: snapShot["imageUrl"],
      username: snapShot["username"],
      bio: snapShot["bio"],
      followers: snapShot["followers"],
      following: snapShot["following"],
    );
  }
}
