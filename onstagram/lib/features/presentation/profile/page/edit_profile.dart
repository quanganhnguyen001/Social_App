import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/usecases/upload_image_usecase.dart';
import 'package:onstagram/features/presentation/profile/widget/edit_profile_form.dart';
import 'package:onstagram/features/presentation/user/user_cubit.dart';

import '../../../../common/profile_widget.dart';
import '../../../../common/toast_component.dart';
import 'package:onstagram/injection_container.dart' as di;

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _faceBookUrlController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  File? _image;
  Future selectImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          ToastComponent().showToast(message: 'Pls Choose Image First');
        }
      });
    } catch (e) {
      ToastComponent().showToast(message: 'Some Error Occured');
    }
  }

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
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    _updateUserProfileData();
                  },
                  icon: _isLoading == false
                      ? Icon(
                          Icons.done,
                          size: 32,
                          color: blueColor,
                        )
                      : CircularProgressIndicator()))
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
                      color: darkGreyColor, shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: profileWidget(
                        imageUrl: widget.currentUser.profileUrl, image: _image),
                  ),
                ),
              ),
              sizeVertical(15),
              Center(
                child: GestureDetector(
                  onTap: selectImage,
                  child: Text(
                    'Change profile photo',
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              sizeVertical(15),
              EditProfileForm(
                readOnly: false,
                title: 'Name',
                controller: _nameController,
              ),
              sizeVertical(15),
              EditProfileForm(
                readOnly: false,
                title: 'Username',
                controller: _userNameController,
              ),
              sizeVertical(15),
              EditProfileForm(
                readOnly: false,
                title: 'Facebook URL',
                controller: _faceBookUrlController,
              ),
              sizeVertical(15),
              EditProfileForm(
                readOnly: false,
                title: 'Bio',
                controller: _bioController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _updateUserProfileData() {
    if (_image == null) {
      updateUserProfile("");
    } else {
      di
          .getIt<UploadImageUseCase>()
          .excute(_image!, false, 'profileImages')
          .then((value) {
        updateUserProfile(value);
      });
    }
  }

  updateUserProfile(String profileUrl) {
    setState(() {
      _isLoading = true;
    });
    BlocProvider.of<UserCubit>(context)
        .updateUser(
            user: UserEntity(
      uid: widget.currentUser.uid,
      name: _nameController.text,
      username: _userNameController.text,
      facebookbUrl: _faceBookUrlController.text,
      bio: _bioController.text,
      profileUrl: profileUrl,
    ))
        .then((value) {
      _userNameController.clear();
      _nameController.clear();
      _faceBookUrlController.clear();
      _bioController.clear();
      _isLoading = false;
    });
    Navigator.pop(context);
  }
}
