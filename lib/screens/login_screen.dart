import 'package:bank_app/app_assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_icons.dart';
import '../app_assets/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4E86F3), Color(0xff1F69F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 60.837 / 100,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _featuresTextStyle('QR Pay', AppIcons.iconQRPay),
                          _featuresTextStyle('ATM', AppIcons.iconATM),
                          _featuresTextStyle('Đặt vé', AppIcons.iconTicket),
                          _featuresTextStyle('Hỗ trợ', AppIcons.iconSupport),
                        ],
                      ),
                    ],
                  )
                ),
                Container(
                  width: size.width,
                  height: size.height * 10.714 / 100,
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xff5dc9a0),
                  child: Text(
                    "Đăng ký tạo tài khoản",
                    textAlign: TextAlign.center,
                    style: AppStyles.textButtonWhite.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    )
                  ),
                )
              ],
            ),
            Positioned(
              left: 16,
              bottom: size.height * 30.788 / 100,
              child: Container(
                width: size.width - 32,
                height: size.height * 56.403 / 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 8, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(AppImages.imageLogoVisa),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xfff7f6f6),
                              borderRadius: BorderRadius.circular(6),
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _featuresTextStyle(String title, String icon) {
    return Column(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            height: 1.5,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
