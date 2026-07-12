import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({super.key, required this.title , this.color , this.textColor});
  final String title;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColor.colore6e),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: color
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
