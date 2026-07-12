import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/widgets/account_item.dart';
import 'package:itiprojectthree/core/widgets/title_page.dart';
class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitlePage(title: "Account"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Divider(color: AppColor.color808),
          SizedBox(height: 15,),
          AccountItem(leadingIcon: Icons.shopping_bag_rounded , title: "My orders"),
          SizedBox(height: 25,),
          Divider(color: AppColor.color808 , height: 8,),
          SizedBox(height: 15,),
          AccountItem(leadingIcon: Icons.details_sharp , title: "My details"),
          SizedBox(height: 15,),
          Divider(color: AppColor.color808),
          SizedBox(height: 15,),
          AccountItem(leadingIcon: Icons.location_on , title: "Address Book"),
          SizedBox(height: 15,),
          Divider(color: AppColor.color808),
          SizedBox(height: 15,),
          AccountItem(leadingIcon: Icons.help , title: "FAQs"),
          SizedBox(height: 15,),
          Divider(color: AppColor.color808),
          SizedBox(height: 15,),
          AccountItem(leadingIcon: Icons.comment_rounded , title: "Help Center"),
          SizedBox(height: 15,),
          Card(
            elevation: 0.0,
            child: ListTile(
              tileColor: Colors.white,
              leading: Icon(Icons.exit_to_app , color: Colors.red,),
              title: Text("Exit to app" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400 , color: Colors.red),),
            ),
          )
        ],
      ),
    );
  }
}