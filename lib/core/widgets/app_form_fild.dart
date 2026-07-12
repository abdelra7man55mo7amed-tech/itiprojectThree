import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class AppFormFild extends StatelessWidget {
  const AppFormFild({
    super.key,
    required this.title,
    required this.textEditingController,
    required this.validator,
    required this.iconButton,
    this.obscureText = false,
  });

  final String title;
  final TextEditingController textEditingController;
  final String? Function(String?) validator;
  final bool obscureText;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: title,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColor.colore6e),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColor.color9c9),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: iconButton,
      ),
    );
  }
}
