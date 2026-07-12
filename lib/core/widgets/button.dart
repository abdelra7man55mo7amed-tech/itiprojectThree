import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.color9c9,
        padding: EdgeInsets.only(top: 15 , bottom: 15)
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.colorfff,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
