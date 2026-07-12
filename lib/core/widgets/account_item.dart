import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
class AccountItem extends StatelessWidget{
  AccountItem({super.key , required this.leadingIcon , required this.title});
  final IconData leadingIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(leadingIcon , color: AppColor.color1a1,),
        title: Text(title , style: TextStyle(color: AppColor.color1a1 , fontSize: 16 , fontWeight: FontWeight.w600),),
        trailing: Icon(Icons.arrow_forward_ios_sharp , color: AppColor.color1a1,),
      ),
    );
  }
}