import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onstagram/common/button_components.dart';
import 'package:onstagram/common/formfield_components.dart';
import 'package:onstagram/common/toast_component.dart';
import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/presentation/auth/cubit/auth/auth_cubit.dart';
import 'package:onstagram/features/presentation/auth/cubit/credential/credential_cubit.dart';

import 'package:onstagram/features/presentation/main_screens.dart';

import '../../../../common/profile_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _image;
  bool isLoading = false;

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
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          // not return widget just listen
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            ToastComponent().showToast(message: 'Invalid Email or PassWord');
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: ((context, authState) {
              if (authState is Authenticated) {
                return MainScreens(uid: authState.uid);
              }
              return _bodyWidget();
            }));
          }
          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/icons/ic_instagram.svg',
              color: primaryColor,
            ),
          ),
          sizeVertical(15),
          GestureDetector(
            onTap: () {
              selectImage();
            },
            child: Center(
              child: Stack(
                children: [
                  Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: profileWidget(image: _image))),
                  const Positioned(
                      right: 1,
                      bottom: 1,
                      child: Icon(
                        Icons.add_a_photo,
                        color: blueColor,
                      ))
                ],
              ),
            ),
          ),
          sizeVertical(15),
          FormFieldComponent(
            hintText: 'Enter your username',
            isPasswordField: false,
            controller: _userNameController,
          ),
          sizeVertical(15),
          FormFieldComponent(
            hintText: 'Enter your email',
            isPasswordField: false,
            controller: _emailController,
          ),
          sizeVertical(15),
          FormFieldComponent(
            hintText: 'Enter your password',
            isPasswordField: true,
            controller: _passwordController,
          ),
          sizeVertical(15),
          isLoading == false
              ? ButtonComponent(
                  text: 'Sign up',
                  color: blueColor,
                  press: () {
                    _signUpUser();
                  },
                )
              : const CircularProgressIndicator(),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          const Divider(
            color: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(color: primaryColor),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, PageConst.signInPage, (route) => false);
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: blueColor),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  _signUpUser() {
    setState(() {
      isLoading = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUp(UserEntity(
      username: _userNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      totalPosts: 0,
      totalFollowings: 0,
      totalFollowers: 0,
      followers: const [],
      followings: const [],
      facebookbUrl: '',
      name: '',
      profileUrl: '',
      bio: '',
      imageFile: _image,
    ))
        .then((value) {
      setState(() {
        _userNameController.clear();
        _emailController.clear();
        _passwordController.clear();
        isLoading = false;
      });
    });
  }
}
