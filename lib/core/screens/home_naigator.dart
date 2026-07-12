import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/screens/Home.dart';
import 'package:itiprojectthree/core/screens/account.dart';
import 'package:itiprojectthree/core/screens/carts.dart';

class HomeNaigator extends StatefulWidget {
  @override
  State<HomeNaigator> createState() => _HomeNaigator();
}

class _HomeNaigator extends State<HomeNaigator> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<Widget> screens = [Home(), Carts(), Account()];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Colors.blueAccent,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: AppColor.color99),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_outlined, color: AppColor.color99),
            label: 'Carts',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person, color: AppColor.color99),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            index = index;
          });
        },
      ),
      body: screens[index],
    );
  }
}
