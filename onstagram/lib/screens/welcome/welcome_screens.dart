import 'package:flutter/material.dart';
import 'package:onstagram/screens/login/login_screens.dart';
import 'package:onstagram/screens/signup/signup_screens.dart';

import '../../common/button_components.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Find new \nfriends nearby',
                      style: TextStyle(
                          fontSize: 44,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'With milions of users all over the world, we \ngives you the ability to connect with people \nno matter where you are.',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                const SizedBox(
                  height: 44,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonComponent(
                      title: 'Log In',
                      color: const Color.fromRGBO(255, 45, 85, 1),
                      backgrounColor: Colors.white,
                      press: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (context) => const LoginScreens(),
                            )));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonComponent(
                      color: Colors.white,
                      title: 'Sign Up',
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(247, 131, 97, 1),
                        Color.fromRGBO(245, 75, 100, 1),
                      ]),
                      press: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (context) => const SignUpScreens(),
                            )));
                      },
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    const Center(
                        child: Text(
                      'Or log in with',
                      style: (TextStyle(
                          fontSize: 13, color: Color.fromRGBO(78, 88, 110, 1))),
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/facebook.png'),
                        Image.asset('assets/icons/gmail.png'),
                        Image.asset('assets/icons/twicht.png')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
