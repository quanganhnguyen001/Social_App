import 'package:flutter/material.dart';

const backGroundColor = Color.fromRGBO(0, 0, 0, 1.0);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;
const darkGreyColor = Color.fromRGBO(97, 97, 97, 1);

Widget sizeVertical(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizeHorizontal(double width) {
  return SizedBox(width: width);
}

class PageConst {
  static const String editProfilePage = 'editProfilePage';
  static const String editPostPage = 'editPostPage';
  static const String commentPage = 'commentPage';
  static const String signInPage = 'signInPage';
  static const String signUpPage = 'signUpPage';
  static const String morInfoPage = 'morInfoPage';
}

class FireBaseConst {
  static const String users = 'users';
  static const String posts = 'posts';
  static const String comments = 'comments';
  static const String replys = 'replys';
}
