import 'package:bank_app/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  await EasyLocalization.ensureInitialized();  // Initialize EasyLocalization to load translations.
  final bool english = await _getLanguage();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],  // Define supported locales for localization.
      path: 'assets/translations',  // Specify the path where translation files are located.
      startLocale: const Locale('en', 'US'),  // Set the default locale when the app starts.
      fallbackLocale: english ? const Locale('en', 'US') : const Locale('vi', 'VN'),  // Set the fallback locale based on the user's language preference.
      child: const MyApp(),
    ),
  );
}

// Function to retrieve the saved language preference from SharedPreferences.
Future<bool> _getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();    // Retrieve an instance of SharedPreferences.
  final String language = prefs.getString('language') ?? 'en_US';    // Get the saved language preference from SharedPreferences, defaulting to 'en_US' if not found.
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
      debugShowCheckedModeBanner: false,  // Remove the debug banner in the top right corner.
      // Use the localizationDelegates, supportedLocales, and locale from the context.
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Mulish',  // Set the default font family for the entire app.
        primarySwatch: Colors.blue,
        // Disable default Widget splash effect in Flutter.
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const SplashScreen(),
    );
  }
}