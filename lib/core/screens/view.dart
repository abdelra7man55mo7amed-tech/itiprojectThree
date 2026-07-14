import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/cachHelper.dart';
import 'package:itiprojectthree/core/screens/home_naigator.dart';
import 'package:itiprojectthree/core/screens/log_in.dart';
import 'package:itiprojectthree/core/widgets/login_or_sign.dart';
import 'package:lottie/lottie.dart';

class View_screen extends StatefulWidget {
  const View_screen({super.key});

  @override
  State<View_screen> createState() => _View_screen();
}

class _View_screen extends State<View_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final token = await CacheHelper.getToken();
      if (!mounted) return;
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeNaigator(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LogIn(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/imgs/shop.json",
          width: 220,
          height: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}