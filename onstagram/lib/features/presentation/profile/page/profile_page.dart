import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/common/bottom_sheet_component.dart';
import 'package:onstagram/common/profile_widget.dart';
import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/presentation/auth/cubit/auth/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.currentUser});
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          currentUser.username.toString(),
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BottomSheetComponent().showBottomSheetComponent(
                    context: context,
                    option1: 'Edit Prodfile',
                    press1: () {
                      Navigator.pushNamed(context, PageConst.editProfilePage,
                          arguments: currentUser);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfile()));
                    },
                    option2: 'More info',
                    press2: () {
                      Navigator.pushNamed(context, PageConst.morInfoPage,
                          arguments: currentUser);
                    },
                    option3: 'Logout',
                    press3: () {
                      BlocProvider.of<AuthCubit>(context).loggedOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageConst.signInPage, (route) => false);
                    });
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: darkGreyColor, shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: profileWidget(imageUrl: currentUser.profileUrl),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            currentUser.totalPosts.toString(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVertical(10),
                          const Text(
                            'Post',
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                      sizeHorizontal(20),
                      Column(
                        children: [
                          Text(
                            currentUser.totalFollowers.toString(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVertical(10),
                          const Text(
                            'Folowwers',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      sizeHorizontal(20),
                      Column(
                        children: [
                          Text(
                            currentUser.totalFollowings.toString(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVertical(10),
                          const Text(
                            'Following',
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              sizeVertical(10),
              Text(
                '${currentUser.name == "" ? currentUser.username : currentUser.name}',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              sizeVertical(10),
              Text(
                '${currentUser.bio == "" ? 'No bio yet ' : currentUser.bio}',
                style: TextStyle(color: primaryColor),
              ),
              sizeVertical(10),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: secondaryColor,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
