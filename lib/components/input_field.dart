import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final Widget? trailing;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool isVisible;
  final bool isErrorText;

  const InputField({
    super.key,
    this.hintText,
    this.icon,
    this.trailing,
    this.controller,
    this.validator,
    this.isVisible = true,
    this.isErrorText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff383838),
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff383838),
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        prefixIcon: Icon(icon),
        suffixIcon: trailing
      ),
      obscureText: isVisible,
    );
  }
}