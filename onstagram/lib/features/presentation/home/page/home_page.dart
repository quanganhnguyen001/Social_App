import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstagram/common/bottom_sheet_component.dart';
import 'package:onstagram/config/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: SvgPicture.asset(
          'assets/icons/ic_instagram.svg',
          color: primaryColor,
          height: 35,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/facebook-messenger2-alt.svg',
                  color: primaryColor,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/vi/thumb/5/5c/Chelsea_crest.svg/1200px-Chelsea_crest.svg.png')),
                          sizeHorizontal(10),
                          const Text(
                            'Messi',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            BottomSheetComponent().showBottomSheetComponent(
                                option1: 'Delete Post',
                                option2: 'Edit Post',
                                context: context,
                                press2: () {
                                  Navigator.pushNamed(
                                      context, PageConst.editPostPage);
                                });
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: primaryColor,
                          ))
                    ],
                  ),
                  sizeVertical(10),
                  Container(
                    color: secondaryColor,
                    width: double.infinity,
                    height: size.height * 0.3,
                  ),
                  sizeVertical(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: primaryColor,
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PageConst.commentPage);
                              },
                              icon: const Icon(
                                Icons.comment,
                                color: primaryColor,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: primaryColor,
                              )),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark,
                            color: primaryColor,
                          )),
                    ],
                  ),
                  const Text(
                    '23 likes',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  sizeVertical(10),
                  Row(
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      sizeHorizontal(10),
                      const Text(
                        'description',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                  sizeVertical(10),
                  const Text(
                    'View 10 comments',
                    style: TextStyle(color: darkGreyColor),
                  ),
                  sizeVertical(10),
                  const Text(
                    '23/08/2001',
                    style: TextStyle(color: darkGreyColor),
                  ),
                  sizeVertical(15)
                ],
              );
            })),
      ),
    );
  }
}
