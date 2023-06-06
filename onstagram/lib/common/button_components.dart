import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.title,
    required this.color,
    this.gradient,
    this.backgrounColor,
    required this.press,
  }) : super(key: key);
  final String title;
  final Color color;
  final Gradient? gradient;
  final Color? backgrounColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.circular(22),
          gradient: gradient),
      child: TextButton(
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
