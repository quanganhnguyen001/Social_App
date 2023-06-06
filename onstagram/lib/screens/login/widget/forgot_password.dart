import 'package:flutter/material.dart';

import 'package:onstagram/common/button_components.dart';
import 'package:onstagram/screens/login/login_screens.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_forgot.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 47,
                  ),
                  const Text(
                    'Forgot password',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    'Please enter your email address. You will \nreceive a link to create a new password \nvia email.',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormFieldComponent(
                          title: 'Your Email', hide: false),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonComponent(
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(247, 131, 97, 1),
                          Color.fromRGBO(245, 75, 100, 1),
                        ]),
                        title: 'SEND',
                        color: Colors.white,
                        backgrounColor: Colors.white,
                        press: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
