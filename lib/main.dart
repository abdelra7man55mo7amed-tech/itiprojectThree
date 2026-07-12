import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/screens/home_naigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeNaigator(),
    );
  }
}