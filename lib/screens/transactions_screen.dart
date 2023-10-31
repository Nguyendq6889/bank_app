import 'package:bank_app/app_assets/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_images.dart';
import '../app_assets/app_styles.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
                height: size.height * 16.748 / 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: AppStyles.colorAppBar,
                ),
                child: Center(child: Text('transactions_history'.tr(), style: AppStyles.titleAppBarWhite)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 51, 16, 16),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              // width: 109,
                              height: 44,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xfff7f6f6)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Tháng 11",
                                      style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff2e2e2e))
                                  ),
                                  SvgPicture.asset(AppIcons.iconArrowDown)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              // width: 109,
                              height: 44,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xfff7f6f6)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Tháng 11",
                                      style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff2e2e2e))
                                  ),
                                  SvgPicture.asset(AppIcons.iconArrowDown)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              // width: 109,
                              height: 44,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xfff7f6f6)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Tháng 11",
                                      style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff2e2e2e))
                                  ),
                                  SvgPicture.asset(AppIcons.iconArrowDown)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


                      const Expanded(child: SizedBox())
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
              height: size.height * 9.852 / 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
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
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff5077F7),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Khoản thu",
                                  style: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1))
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Text(
                                "16.100.000",
                                style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: const Color(0xffEEEEEE),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffD03339),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Khoản chi",
                                  style: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1))
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Text(
                                "2.100.000.000",
                                style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                        Text('Chọn ngôn ngữ', style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(AppIcons.iconClose),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        "Bạn muốn dùng ngôn ngữ nào cho ứng dụng?",
                        style: AppStyles.textButtonGray
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildLanguageOptions(AppIcons.iconVietNam, 'Tiếng Việt', selected: true),
              _buildLanguageOptions(AppIcons.iconEnglish, 'English', selected: false),
            ],
          ),
        );
      },
    );
  }
}
