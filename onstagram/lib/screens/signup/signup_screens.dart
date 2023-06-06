import 'package:flutter/material.dart';

import 'package:onstagram/screens/login/login_screens.dart';

import '../../common/button_components.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/signup_background_image .png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 47,
                ),
                const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormFieldComponent(title: 'Username', hide: false),
                      const SizedBox(
                        height: 10,
                      ),
                      const FormFieldComponent(title: 'Email', hide: false),
                      const SizedBox(
                        height: 10,
                      ),
                      const FormFieldComponent(title: 'Password', hide: false),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonComponent(
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(247, 131, 97, 1),
                          Color.fromRGBO(245, 75, 100, 1),
                        ]),
                        title: 'SIGNUP',
                        color: Colors.white,
                        backgrounColor: Colors.white,
                        press: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 144,
                ),
                const Text(
                  'By clicking Sign up you agree to the following',
                  style: TextStyle(
                      color: Color.fromRGBO(78, 88, 110, 1), fontSize: 13),
                ),
                const Text(
                  'Terms and Conditions without reservation',
                  style: TextStyle(
                      color: Color.fromRGBO(78, 88, 110, 1), fontSize: 13),
                )
              ],
            )));
  }
}
