import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/presentation/profile/widget/edit_profile_form.dart';
import 'package:onstagram/features/presentation/user/user_cubit.dart';

import '../../../../common/profile_widget.dart';

class MoreInfoPage extends StatefulWidget {
  const MoreInfoPage({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _faceBookUrlController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.currentUser.name);
    _userNameController =
        TextEditingController(text: widget.currentUser.username);
    _faceBookUrlController =
        TextEditingController(text: widget.currentUser.facebookbUrl);
    _bioController = TextEditingController(text: widget.currentUser.bio);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _faceBookUrlController.dispose();
    _bioController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                      color: darkGreyColor, shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child:
                        profileWidget(imageUrl: widget.currentUser.profileUrl),
                  ),
                ),
              ),
              sizeVertical(15),
              const Center(
                child: Text(
                  'Full size Photo',
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              sizeVertical(15),
              EditProfileForm(
                title: 'Name',
                readOnly: true,
                controller: _nameController,
              ),
              sizeVertical(15),
              EditProfileForm(
                title: 'Username',
                readOnly: true,
                controller: _userNameController,
              ),
              sizeVertical(15),
              EditProfileForm(
                title: 'Facebook URL',
                controller: _faceBookUrlController,
                readOnly: true,
              ),
              sizeVertical(15),
              EditProfileForm(
                title: 'Bio',
                controller: _bioController,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
