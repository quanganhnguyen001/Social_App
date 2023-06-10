import 'package:firebase_auth/firebase_auth.dart';
import 'package:onstagram/models/user.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  var currentUser = UserModel.empty;

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future signup({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw e.toString();
    }
  }
}

extension on User {
  UserModel get toUser =>
      UserModel(id: uid, email: email, name: displayName, photo: photoURL);
}
