import 'package:flutter/material.dart';

import '../config/const.dart';

class ButtonComponent extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? press;
  const ButtonComponent({Key? key, this.color, this.text, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        child: Center(
          child: Text(
            "$text",
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
