import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstagram/common/button_components.dart';
import 'package:onstagram/common/formfield_components.dart';
import 'package:onstagram/config/const.dart';

import '../../../../common/toast_component.dart';
import '../../main_screens.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/credential/credential_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
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
          sizeVertical(30),
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
                  text: 'Sign in',
                  color: blueColor,
                  press: () {
                    signIn();
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
                "Don't have an account? ",
                style: TextStyle(color: primaryColor),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, PageConst.signUpPage, (route) => false);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: blueColor),
                  ))
            ],
          )
        ],
      ),
    );
  }

  signIn() {
    setState(() {
      isLoading = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signIn(
            email: _emailController.text, password: _passwordController.text)
        .then((value) {
      setState(() {
        _emailController.clear();
        _passwordController.clear();
        isLoading = false;
      });
    });
  }
}
