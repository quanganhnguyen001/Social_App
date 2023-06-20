import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/common/bottom_sheet_component.dart';
import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/presentation/auth/cubit/auth/auth_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text(
          'Username',
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BottomSheetComponent().showBottomSheetComponent(
                    context: context,
                    option1: 'Edit Prodfile',
                    press1: () {
                      Navigator.pushNamed(context, PageConst.editProfilePage);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfile()));
                    },
                    option2: 'Logout',
                    press2: () {
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
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            '2',
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
                          const Text(
                            '54',
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
                          const Text(
                            '20',
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
              const Text(
                'Name',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              sizeVertical(10),
              const Text(
                'Bio of user',
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
