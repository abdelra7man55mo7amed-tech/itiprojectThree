import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/helpers/cachHelper.dart';
import 'package:itiprojectthree/core/screens/log_in.dart';
import 'package:itiprojectthree/core/widgets/account_item.dart';
import 'package:itiprojectthree/core/widgets/title_page.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitlePage(title: "Account".tr()),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Divider(color: AppColor.color808),
          SizedBox(height: 15),
          AccountItem(
            leadingIcon: Icons.shopping_bag_rounded,
            title: "Orders".tr(),
          ),
          SizedBox(height: 10),
          Divider(color: AppColor.color808, height: 8),
          SizedBox(height: 10),
          AccountItem(leadingIcon: Icons.details_sharp, title: "Details".tr()),
          SizedBox(height: 10),
          Divider(color: AppColor.color808),
          SizedBox(height: 10),
          AccountItem(leadingIcon: Icons.location_on, title: "Address_Book".tr()),
          SizedBox(height: 10),
          Divider(color: AppColor.color808),
          SizedBox(height: 10),
          AccountItem(leadingIcon: Icons.help, title: "FAQs".tr()),
          SizedBox(height: 10),
          Divider(color: AppColor.color808),
          SizedBox(height: 10),
          AccountItem(leadingIcon: Icons.comment_rounded, title: "Help_Center".tr()),
          SizedBox(height: 10),
          Card(
            elevation: 0.0,
            child: ListTile(
              tileColor: Colors.white,
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: TextButton(
                onPressed: () {
                  CacheHelper.deleteToken();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LogIn()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Exit_to_app".tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              if(context.locale.languageCode == "en"){
                context.setLocale(Locale("ar"));
              }else{
                context.setLocale(Locale("en"));
              }
            }, child: Text("Change_lang".tr())),
          )
        ],
      ),
    );
  }
}
