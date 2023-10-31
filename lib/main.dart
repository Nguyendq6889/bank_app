import 'package:bank_app/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final bool english = await _getLanguage();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      startLocale: const Locale('en', 'US'),
      fallbackLocale: english ? const Locale('en', 'US') : const Locale('vi', 'VN'),
      child: const MyApp(),
    ),
  );
}

Future<bool> _getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String language = prefs.getString('language') ?? 'en_US';
  if (language == 'vi_VN') {
    return false;
  }
  return true;
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
      title: 'Bank App',
      theme: ThemeData(
        fontFamily: 'Mulish',
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}