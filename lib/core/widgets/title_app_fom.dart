import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class TitleAppFom extends StatelessWidget{
  const TitleAppFom({super.key , required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title , style: TextStyle(color: AppColor.color1a1 , fontSize: 16 , fontWeight: FontWeight.w500),);
  }
}