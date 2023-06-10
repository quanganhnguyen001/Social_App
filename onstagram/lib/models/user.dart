import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;
  final int? phone;
  final int? follower;
  final int? following;
  final int? aboutme;
  const UserModel({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.phone,
    this.follower,
    this.following,
    this.aboutme,
  });

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      photo,
      phone,
      follower,
      following,
      aboutme,
    ];
  }
}
