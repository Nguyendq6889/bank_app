import 'package:bank_app/app_assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_images.dart';
import '../app_assets/app_styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 20.689 / 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff4E86F3), Color(0xff1F69F6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Image.asset(AppImages.avatar),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Đỗ Quang Nguyên', style: AppStyles.titleAppBarWhite),
                          const SizedBox(height: 4),
                          Text(
                            "Chạm để xem và sửa thông tin",
                            style: AppStyles.textFeatures.copyWith(color: Colors.white, fontWeight: FontWeight.w400)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: size.height * 16.748 / 100,
            child: Column(
              children: [
                Container(
                  width: size.width - 32,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFeature(AppIcons.iconNotifications, 'Thông báo'),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconSecurity, 'Bảo mật', showMark: true),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconHelp, 'Trợ giúp'),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconContact, 'Liên hệ'),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconLanguages, 'Ngôn ngữ', showLanguage: true),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconLogOut, 'Đăng xuất', hideArrowRight: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Phiên bản v2.0', style: AppStyles.textFeatures.copyWith(color: const Color(0xffA1A1A1))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeature(String icon, String label, {bool? hideArrowRight, bool? showLanguage, bool? showMark}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 20),
                child: SvgPicture.asset(icon),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: AppStyles.textButtonGray
              )
            ],
          ),
          (hideArrowRight ?? false) ? const SizedBox() : Row(
            children: [
              (showLanguage ?? false)
                  ? Text('Tiếng Việt', style: AppStyles.textButtonBlue.copyWith(fontWeight: FontWeight.w600))
                  : const SizedBox(),
              (showMark ?? false)
                  ? SvgPicture.asset(AppIcons.iconMark)
                  : const SizedBox(),
              const SizedBox(width: 12),
              SvgPicture.asset(AppIcons.iconArrowRight),
            ],
          ),
        ],
      ),
    );
  }
}
