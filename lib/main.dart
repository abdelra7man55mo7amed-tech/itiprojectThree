import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/screens/home_naigator.dart';
import 'package:itiprojectthree/core/screens/log_in.dart';
import 'package:itiprojectthree/core/screens/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'ar'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: View_screen(),
    );
  }
}
