
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/screens/Home.dart';
import 'package:itiprojectthree/core/screens/account.dart';
import 'package:itiprojectthree/core/screens/carts.dart';
import 'package:itiprojectthree/core/screens/locations.dart';

class HomeNaigator extends StatefulWidget {
  const HomeNaigator({super.key});

  @override
  State<HomeNaigator> createState() => _HomeNaigatorState();
}

class _HomeNaigatorState extends State<HomeNaigator> {
  int index = 0;
  final List<Widget> screens = [
    Home(),
    Carts(),
    Account(),
    Locations()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          Icon(Icons.shopping_cart_sharp, color: Colors.white),
          Icon(Icons.account_balance, color: Colors.white),
          Icon(Icons.location_history_outlined, color: Colors.white),
        ],
        color: AppColor.color9c9,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
    );
  }
}