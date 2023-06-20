import 'package:onstagram/features/domain/user/entities/user_entity.dart';

abstract class UserRepository {
  // for Auth
  Future signIn(UserEntity user);

  Future signUp(UserEntity user);

  Future<bool> isSignIn();

  Future signOut();

  // for User

  Stream<List<UserEntity>> getAllUser(UserEntity user);

  Stream<List<UserEntity>> getSingleUser(String uid);

  Future<String> getCurrentUid();

  Future createUser(UserEntity user);

  Future updateUser(UserEntity user);
}
