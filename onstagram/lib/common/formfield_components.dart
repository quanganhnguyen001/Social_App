import 'package:flutter/material.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent({
    Key? key,
    required this.title,
    required this.hide,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final bool hide;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
