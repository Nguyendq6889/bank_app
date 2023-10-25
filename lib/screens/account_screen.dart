import 'package:bank_app/app_assets/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
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
  String language = 'vi_VN';
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
                    colors: [Color(0xff6592f2), Color(0xff1f68f4)],
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
                            "touch_to_view".tr(),
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
                      _buildFeature(AppIcons.iconNotifications, 'notification'.tr()),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconSecurity, 'security'.tr(), showMark: true),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconHelp, 'help'.tr()),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconContact, 'contact'.tr()),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(
                        AppIcons.iconLanguages,
                        'language'.tr(),
                        showLanguage: true,
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _modalBottomSheetThanhToan(
                              onTap: () {
                                print('opennnn');
                              }
                            );
                          });
                        }
                      ),
                      const Divider(height: 1, color: Color(0xffF1F1F1), thickness: 1),
                      _buildFeature(AppIcons.iconLogOut, 'sign_out'.tr(), hideArrowRight: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('version'.tr() + ' v2.0', style: AppStyles.textFeatures.copyWith(color: const Color(0xffA1A1A1))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeature(String icon, String label, {bool? hideArrowRight, bool? showLanguage, bool? showMark, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
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
                    ? Text(language == 'vi_VN' ? 'Tiếng Việt' : 'English', style: AppStyles.textButtonBlue.copyWith(fontWeight: FontWeight.w600))
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
      ),
    );
  }

  Widget _buildLanguageOptions(String icon, String label, {bool? selected, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        color: (selected ?? false) ? const Color(0xfff1f1f1) : null,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: AppStyles.textNormalBlack
                )
              ],
            ),
            (selected ?? false)
                ? SvgPicture.asset(AppIcons.iconSelected)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _modalBottomSheetThanhToan({required VoidCallback onTap}) {
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 25 * MediaQuery.of(context).size.height / 100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('select_language'.tr(), style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(AppIcons.iconClose),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'language_use_question'.tr(),
                      style: AppStyles.textButtonGray
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildLanguageOptions(
                AppIcons.iconVietNam,
                'Tiếng Việt', selected: language == 'vi_VN',
                onTap: () {
                  context.setLocale(const Locale('vi', 'VN'));
                  setState(() {
                    language = context.locale.toString();
                  });
                  Navigator.pop(context);
                },
              ),
              _buildLanguageOptions(
                AppIcons.iconEnglish,
                'English', selected: language == 'en_US',
                onTap: (){
                  context.setLocale(const Locale('en', 'US'));
                  setState(() {
                    language = context.locale.toString();
                  });
                  print(context.locale.toString());

                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
