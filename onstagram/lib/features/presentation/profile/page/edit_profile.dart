import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/presentation/profile/widget/edit_profile_form.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text('Edit Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                  size: 32,
                  color: blueColor,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                ),
              ),
              sizeVertical(15),
              const Center(
                child: Text(
                  'Change profile photo',
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              sizeVertical(15),
              const EditProfileForm(
                title: 'Name',
              ),
              sizeVertical(15),
              const EditProfileForm(
                title: 'Username',
              ),
              sizeVertical(15),
              const EditProfileForm(
                title: 'Facebook URL',
              ),
              sizeVertical(15),
              const EditProfileForm(
                title: 'Bio',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
