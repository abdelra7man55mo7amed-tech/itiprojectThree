import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class LoginOrSign extends StatelessWidget{
  LoginOrSign({super.key , required this.title , required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400 , color: AppColor.color808),),
        Text(subtitle , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500 , color: AppColor.color1a1),)
      ],
    );
  }
}