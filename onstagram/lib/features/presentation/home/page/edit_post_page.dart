import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/presentation/profile/widget/edit_profile_form.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage({super.key});

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                  color: blueColor,
                  size: 28,
                )),
          )
        ],
        backgroundColor: backGroundColor,
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor,
                ),
              ),
              sizeVertical(10),
              const Text(
                'Username',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              sizeVertical(10),
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(color: secondaryColor),
              ),
              sizeVertical(10),
              const EditProfileForm(
                title: 'Description',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
