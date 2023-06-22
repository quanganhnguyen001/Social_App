import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? username;
  final String? name;
  final String? email;
  final String? bio;
  final String? facebookbUrl;
  final String? profileUrl;
  final List? followers;
  final List? followings;
  final num? totalFollowers;
  final num? totalFollowings;
  final num? totalPosts;

  const UserModel(
      {this.uid,
      this.username,
      this.name,
      this.email,
      this.bio,
      this.facebookbUrl,
      this.profileUrl,
      this.followers,
      this.followings,
      this.totalFollowers,
      this.totalFollowings,
      this.totalPosts})
      : super(
          uid: uid,
          username: username,
          name: name,
          email: email,
          facebookbUrl: facebookbUrl,
          bio: bio,
          profileUrl: profileUrl,
          followers: followers,
          followings: followings,
          totalFollowers: totalFollowers,
          totalFollowings: totalFollowings,
          totalPosts: totalPosts,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      username: snapshot['username'],
      name: snapshot['name'],
      email: snapshot['email'],
      facebookbUrl: snapshot['facebookUrl'],
      bio: snapshot['bio'],
      profileUrl: snapshot['profileUrl'],
      followers: List.from(snap.get('followers')),
      followings: List.from(snap.get('followings')),
      totalFollowers: snapshot['totalFollowers'],
      totalFollowings: snapshot['totalFollowings'],
      totalPosts: snapshot['totalPost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'name': name,
      'email': email,
      'facebookUrl': facebookbUrl,
      'bio': bio,
      'profileUrl': profileUrl,
      'followers': followers,
      'followings': followings,
      'totalFollowers': totalFollowers,
      'totalFollowings': totalFollowings,
      'totalPost': totalPosts,
    };
  }
}
