import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLines,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
