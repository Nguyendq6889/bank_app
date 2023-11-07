import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_colors.dart';
import '../app_assets/app_icons.dart';
import '../app_assets/app_styles.dart';

class QRCodeInfo extends StatelessWidget {
  const QRCodeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 16.748 / 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: AppColors.colorAppBar,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(AppIcons.iconBack),
                      ),
                      Text('qr_code_scan'.tr(), style: AppStyles.titleAppBarWhite.copyWith(height: 1)),
                      const SizedBox(width: 10)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: size.height * 11.822 / 100,
            child: Container(
              width: size.width - 32,
              height: size.height * 58.497 / 100,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                  Text(
                    "Thông tin mã QR",
                    style: AppStyles.titleAppBarBlack.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tên tài khoản : ",
                        style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff888888)),
                      ),
                      const Text(
                        "Manwah Hotpot",
                        style: AppStyles.textButtonBlack,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Số tài khoản : ",
                        style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff888888)),
                      ),
                      const Text(
                        "1014686229",
                        style: AppStyles.textButtonBlack,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Số tiền :",
                        style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff888888)),
                      ),
                      const Text(
                        "100.000 VND",
                        style: AppStyles.textButtonBlack,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tin nhắn :",
                        style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff888888)),
                      ),
                      const Text(
                        "Mua sắm tại Elise",
                        style: AppStyles.textButtonBlack,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
