import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onstagram/common/toast_component.dart';
import 'package:onstagram/config/const.dart';

import 'package:onstagram/features/data/user/datasource/user_remote_datasource.dart';
import 'package:onstagram/features/data/user/models/user_model.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  UserRemoteDataSourceImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });
  @override
  Future createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FireBaseConst.users);
    final uid = await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        uid: uid,
        username: user.username,
        name: user.name,
        email: user.email,
        bio: user.bio,
        facebookbUrl: user.facebookbUrl,
        profileUrl: user.profileUrl,
        followers: user.followers,
        followings: user.followings,
        totalFollowers: user.totalFollowers,
        totalFollowings: user.totalFollowings,
        totalPosts: user.totalPosts,
      ).toJson();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    });
  }

  @override
  Stream<List<UserEntity>> getAllUser(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FireBaseConst.users);

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> getCurrentUid() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore
        .collection(FireBaseConst.users)
        .where('uid', isEqualTo: uid)
        .limit(1);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future signIn(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ToastComponent().showToast(message: 'User Not Found');
      } else if (e.code == 'wrong-password') {
        ToastComponent().showToast(message: 'Invalid Email or PassWord');
      }
    }
  }

  @override
  Future signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future signUp(UserEntity user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!)
          .then((value) async {
        if (value.user!.uid != null) {
          await createUser(user);
        }
      });
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ToastComponent().showToast(message: 'Email is already in use');
      } else {
        ToastComponent().showToast(message: 'Something went wrong');
      }
    }
  }

  @override
  Future updateUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FireBaseConst.users);
    Map<String, dynamic> userInfo = {};

    if (user.username != '' && user.username != null) {
      userInfo['username'] = user.username;
    }

    if (user.facebookbUrl != '' && user.facebookbUrl != null) {
      userInfo['facebookUrl'] = user.facebookbUrl;
    }

    if (user.profileUrl != '' && user.profileUrl != null) {
      userInfo['profileUrl'] = user.profileUrl;
    }

    if (user.bio != '' && user.bio != null) userInfo['bio'] = user.bio;

    if (user.name != '' && user.name != null) userInfo['name'] = user.name;

    if (user.totalFollowings != null) {
      userInfo['totalFollowings'] = user.totalFollowings;
    }

    if (user.totalFollowers != null) {
      userInfo['totalFollowers'] = user.totalFollowers;
    }

    if (user.totalPosts != null) userInfo['totalPosts'] = user.totalPosts;

    userCollection.doc(user.uid).update(userInfo);
  }
}
