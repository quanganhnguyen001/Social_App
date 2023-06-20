import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool isReply = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Comment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: secondaryColor),
                    ),
                    sizeHorizontal(10),
                    const Text(
                      'Username',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                sizeVertical(10),
                const Text(
                  'This is a commenet',
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ),
          sizeVertical(10),
          const Divider(
            color: secondaryColor,
          ),
          sizeVertical(10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: secondaryColor),
                  ),
                  sizeHorizontal(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                  color: primaryColor,
                                )),
                          ],
                        ),
                        const Text(
                          'This is a commenet',
                          style: TextStyle(color: primaryColor),
                        ),
                        sizeVertical(5),
                        Row(
                          children: [
                            const Text(
                              '23/08/2001',
                              style:
                                  TextStyle(color: darkGreyColor, fontSize: 12),
                            ),
                            sizeHorizontal(15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isReply = !isReply;
                                });
                              },
                              child: const Text(
                                'Reply',
                                style: TextStyle(
                                    color: darkGreyColor, fontSize: 12),
                              ),
                            ),
                            sizeHorizontal(15),
                            const Text(
                              'View Replys',
                              style:
                                  TextStyle(color: darkGreyColor, fontSize: 12),
                            )
                          ],
                        ),
                        isReply == true ? sizeVertical(10) : sizeVertical(0),
                        isReply == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 55,
                                    color: Colors.grey[800],
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: TextFormField(
                                            style: const TextStyle(
                                                color: primaryColor),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Post your reply...",
                                                hintStyle: TextStyle(
                                                    color: secondaryColor)),
                                          )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.send,
                                                color: blueColor,
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(
                                width: 0,
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _commentSection()
        ],
      ),
    );
  }

  _commentSection() {
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
            ),
            sizeHorizontal(10),
            Expanded(
                child: TextFormField(
              style: const TextStyle(color: primaryColor),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Post your comment...",
                  hintStyle: TextStyle(color: secondaryColor)),
            )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: blueColor,
                ))
          ],
        ),
      ),
    );
  }
}
