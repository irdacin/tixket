import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final FocusNode? focusNode;
  final IconData? icon;
  final Widget? trailing;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final void Function(String)? onChanged;
  final bool isVisible;
  final String? hintText;
  final String? errorText;

  const InputField({
    super.key,
    this.labelText,
    this.focusNode,
    this.icon,
    this.trailing,
    this.controller,
    this.validator,
    this.onChanged,
    this.isVisible = true,
    this.hintText,
    this.errorText, 
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool focusText = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      setState(() {
        focusText = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => widget.onChanged?.call(value),
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: widget.labelText,
        labelStyle: 
          focusText ? const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ) : const TextStyle(
            fontSize: 15,
          ) ,
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: const TextStyle(
          fontSize: 12
        ),
        prefixIcon: Icon(widget.icon),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimaryFixed,
        suffixIcon: widget.trailing,
      ),
      obscureText: !widget.isVisible,
    );
  }
}