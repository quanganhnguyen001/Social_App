import 'package:flutter/material.dart';

import '../config/const.dart';

class FormFieldComponent extends StatefulWidget {
  const FormFieldComponent(
      {super.key,
      this.hintText,
      this.onChanged,
      this.controller,
      this.fieldKey,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      this.isPasswordField});

  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? isPasswordField;
  final Key? fieldKey;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  @override
  State<FormFieldComponent> createState() => _FormFieldComponentState();
}

class _FormFieldComponentState extends State<FormFieldComponent> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(.35),
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextFormField(
        style: const TextStyle(color: primaryColor),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: secondaryColor),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? blueColor : secondaryColor,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
