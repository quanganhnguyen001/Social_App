import 'dart:io';

import 'package:onstagram/features/data/user/datasource/user_remote_datasource.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class UserRepositoryIml implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryIml({
    required this.remoteDataSource,
  });
  @override
  Future createUser(UserEntity user) async {
    return remoteDataSource.createUser(user);
  }

  @override
  Stream<List<UserEntity>> getAllUser(UserEntity user) {
    return remoteDataSource.getAllUser(user);
  }

  @override
  Future<String> getCurrentUid() async {
    return remoteDataSource.getCurrentUid();
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    return remoteDataSource.getSingleUser(uid);
  }

  @override
  Future<bool> isSignIn() {
    return remoteDataSource.isSignIn();
  }

  @override
  Future signIn(UserEntity user) {
    return remoteDataSource.signIn(user);
  }

  @override
  Future signOut() {
    return remoteDataSource.signOut();
  }

  @override
  Future signUp(UserEntity user) {
    return remoteDataSource.signUp(user);
  }

  @override
  Future updateUser(UserEntity user) {
    return remoteDataSource.updateUser(user);
  }

  @override
  Future uploadImage(File? file, bool isPost, String childName) {
    return remoteDataSource.uploadImage(file, isPost, childName);
  }
}
