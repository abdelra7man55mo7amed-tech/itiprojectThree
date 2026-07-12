import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class SubtitlePage extends StatelessWidget{
  const SubtitlePage({super.key , required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title , style: TextStyle(color: AppColor.color808 , fontSize: 16 , fontWeight: FontWeight.w400),);
  }
}