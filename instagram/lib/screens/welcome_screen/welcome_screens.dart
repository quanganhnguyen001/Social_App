import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                  children: [
                    Text(
                      'Find new \nfriends nearby',
                      style: TextStyle(
                          fontSize: 44,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'With milions of users all over the world, we \ngives you the ability to connect with people \nno matter where you are.',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                SizedBox(
                  height: 44,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonComponent(
                      title: 'Log In',
                      color: Color.fromRGBO(255, 45, 85, 1),
                      backgrounColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonComponent(
                      color: Colors.white,
                      title: 'Sign Up',
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 131, 97, 1),
                        Color.fromRGBO(245, 75, 100, 1),
                      ]),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Center(
                        child: Text(
                      'Or log in with',
                      style: (TextStyle(
                          fontSize: 13, color: Color.fromRGBO(78, 88, 110, 1))),
                    )),
                    SizedBox(
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

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.title,
    required this.color,
    this.gradient,
    this.backgrounColor,
  }) : super(key: key);
  final String title;
  final Color color;
  final Gradient? gradient;
  final Color? backgrounColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.circular(22),
          gradient: gradient),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
