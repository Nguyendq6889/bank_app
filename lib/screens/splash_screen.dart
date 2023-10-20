import 'package:bank_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MyHomePage()));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff6592f2), Color(0xff1f68f4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chào mừng đến với",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
              ),
              SizedBox(height: 16),
              Text(
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
