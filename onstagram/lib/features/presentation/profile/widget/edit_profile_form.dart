import 'package:flutter/material.dart';

import '../../../../config/const.dart';

class EditProfileForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  const EditProfileForm({Key? key, this.title, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(color: primaryColor, fontSize: 16),
        ),
        sizeVertical(10),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: primaryColor),
          decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: primaryColor)),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: secondaryColor,
        )
      ],
    );
  }
}
