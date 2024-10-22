import 'package:flutter/material.dart';

class LandingScreenTextField extends StatelessWidget {
  const LandingScreenTextField({
    required this.controller,
    required this.hintText,
    required this.autofillHints,
    required this.textInputAction,
    this.onSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.labelTextSuffix = '',
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final Iterable<String> autofillHints;
  final TextInputAction textInputAction;
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onChanged;
  final bool obscureText;
  final String labelTextSuffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        autofillHints: autofillHints,
        obscureText: obscureText,
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          labelText: '$hintText$labelTextSuffix',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}