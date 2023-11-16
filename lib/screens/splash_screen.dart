import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_assets/app_colors.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const SignInScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.colorAppBar,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'welcome_to'.tr(),
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
              ),
              const SizedBox(height: 16),
              const Text(
                "Mobile banking",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
