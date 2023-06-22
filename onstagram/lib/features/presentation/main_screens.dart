import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/usecases/get_single_user_usecases.dart';
import 'package:onstagram/features/presentation/activity/page/activity_page.dart';
import 'package:onstagram/features/presentation/home/page/home_page.dart';
import 'package:onstagram/features/presentation/profile/page/profile_page.dart';
import 'package:onstagram/features/presentation/search/page/search_page.dart';
import 'package:onstagram/features/presentation/uploadpost/page/upload_post_page.dart';
import 'package:onstagram/features/presentation/user/get_single_user/get_single_user_cubit.dart';

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
  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, state) {
        if (state is GetSingleUserSuccess) {
          List<Widget> body = [
            const HomePage(),
            const Searchpage(),
            const UploadPostPage(),
            const ActivityPage(),
            ProfilePage(
              currentUser: state.user,
            ),
          ];

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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
