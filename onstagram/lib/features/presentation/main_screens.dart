import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/presentation/activity/page/activity_page.dart';
import 'package:onstagram/features/presentation/home/page/home_page.dart';
import 'package:onstagram/features/presentation/profile/page/profile_page.dart';
import 'package:onstagram/features/presentation/search/page/search_page.dart';
import 'package:onstagram/features/presentation/uploadpost/page/upload_post_page.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _currentIndex = 0;
  List<Widget> body = [
    const HomePage(),
    const Searchpage(),
    const UploadPostPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      backgroundColor: backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backGroundColor,
        items: const [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
                size: 30,
                color: primaryColor,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
                size: 30,
                color: primaryColor,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add_circle_outline,
                size: 30,
                color: primaryColor,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: primaryColor,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
                color: primaryColor,
              )),
        ],
      ),
    );
  }
}
