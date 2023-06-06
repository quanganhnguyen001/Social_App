import 'package:flutter/material.dart';

import 'package:onstagram/common/button_components.dart';
import 'package:onstagram/screens/login/widget/forgot_password.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Login to your account',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    const SizedBox(
                      height: 58,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const FormFieldComponent(
                          title: 'Email',
                          hide: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const FormFieldComponent(
                          title: 'Password',
                          hide: true,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonComponent(
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(247, 131, 97, 1),
                            Color.fromRGBO(245, 75, 100, 1),
                          ]),
                          title: 'LOGIN',
                          color: Colors.white,
                          backgrounColor: Colors.white,
                          press: () {},
                        ),
                        const SizedBox(
                          height: 53,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPassWord()));
                            },
                            child: const Text(
                              'Forgot your password?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent({
    Key? key,
    required this.title,
    required this.hide,
  }) : super(key: key);
  final String title;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hide,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: Colors.white24,
          hintText: title,
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(22))),
    );
  }
}
