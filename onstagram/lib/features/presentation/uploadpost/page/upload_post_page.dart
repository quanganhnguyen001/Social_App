import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor.withOpacity(0.3),
              ),
              child: const Center(
                  child: Icon(
                Icons.upload,
                size: 40,
                color: primaryColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
