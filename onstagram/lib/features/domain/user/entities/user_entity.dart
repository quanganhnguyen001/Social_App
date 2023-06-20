import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
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

  // not store in Firebase
  final String? password;
  final String? otherUId;
  const UserEntity({
    this.uid,
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
    this.totalPosts,
    this.password,
    this.otherUId,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      username,
      name,
      email,
      bio,
      facebookbUrl,
      profileUrl,
      followers,
      followings,
      totalFollowers,
      totalFollowings,
      totalPosts,
      password,
      otherUId,
    ];
  }
}
