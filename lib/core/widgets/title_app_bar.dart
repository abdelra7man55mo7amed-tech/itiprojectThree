import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class TitleAppBar extends StatelessWidget{
  TitleAppBar({super.key , required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title , style: TextStyle(color:AppColor.color1a1 , fontSize: 24 , fontWeight: FontWeight.w600),);
  }
}