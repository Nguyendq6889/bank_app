import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_colors.dart';
import '../app_assets/app_icons.dart';
import '../app_assets/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  PageController pageController = PageController();
  final List<Model> _listFeatures = [
    const Model('QR Pay', AppIcons.iconQRPay),
    const Model('ATM', AppIcons.iconATM),
    Model('book_tickets'.tr(), AppIcons.iconTicket),
    Model('support'.tr(), AppIcons.iconSupport),
    const Model('QR Pay', AppIcons.iconQRPay),
    const Model('ATM', AppIcons.iconATM),
    Model('book_tickets'.tr(), AppIcons.iconTicket),
    Model('support'.tr(), AppIcons.iconSupport),
    const Model('QR Pay', AppIcons.iconQRPay),
    const Model('ATM', AppIcons.iconATM),
    Model('book_tickets'.tr(), AppIcons.iconTicket),
    Model('support'.tr(), AppIcons.iconSupport),
    const Model('QR Pay', AppIcons.iconQRPay),
    const Model('ATM', AppIcons.iconATM),
    Model('book_tickets'.tr(), AppIcons.iconTicket),
    Model('support'.tr(), AppIcons.iconSupport),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.colorAppBar,
        ),
        child: Column(
          children: [
            Container(
              height: size.height * 23.275 / 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "${'hello'.tr()}, Đỗ Quang Nguyên",
                      style: AppStyles.titleAppBarWhite
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'payment_account'.tr(),
                          style: AppStyles.textButtonWhite.copyWith(fontWeight: FontWeight.w400, height: 1.5)
                        ),
                        Text(
                          "1014686229",
                          style: AppStyles.textButtonWhite.copyWith(height: 1.5)
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'current_balance'.tr(),
                          style: AppStyles.textButtonWhite.copyWith(fontWeight: FontWeight.w400, height: 1.5)
                        ),
                        Text(
                          "12.000.000",
                          style: AppStyles.titleAppBarWhite.copyWith(fontSize: 22)
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "VND",
                        style: AppStyles.textButtonWhite.copyWith(fontWeight: FontWeight.w400)
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'features'.tr(),
                              style: AppStyles.textButtonBlack
                            ),
                            Text(
                              'all'.tr(),
                              style: AppStyles.textButtonBlue
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          childAspectRatio: 1.4,
                          mainAxisSpacing: 12,
                          crossAxisCount: 4,
                          children: <Widget>[
                            _featuresTextStyle('transfer'.tr(), AppIcons.iconTransfer),
                            _featuresTextStyle('payment'.tr(), AppIcons.iconPayment),
                            _featuresTextStyle('saving'.tr(), AppIcons.iconSaving),
                            _featuresTextStyle('payment_request'.tr(), AppIcons.iconPaymentRequest),
                            _featuresTextStyle('account'.tr(), AppIcons.iconWallet),
                            _featuresTextStyle('card_service'.tr(), AppIcons.iconCards),
                            _featuresTextStyle('insurance'.tr(), AppIcons.iconInsurance),
                            _featuresTextStyle('top_up'.tr(), AppIcons.iconTopUp),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // SizedBox(
                        //   height: 200,
                        //   child: PageView.builder(
                        //       controller: pageController,
                        //       itemCount: 2,
                        //       onPageChanged: (index) {
                        //         setState(() {
                        //           selectedIndex = index;
                        //         });
                        //       },
                        //       itemBuilder: (_, pageIndex) {
                        //         return GridView.count(
                        //           physics: const NeverScrollableScrollPhysics(),
                        //           padding: EdgeInsets.zero,
                        //           primary: false,
                        //           childAspectRatio: 1.1,
                        //           shrinkWrap: true,
                        //           crossAxisSpacing: 0,
                        //           mainAxisSpacing: 0,
                        //           crossAxisCount: 4,
                        //           children: List.generate(_listFeatures.length ~/ 2, (index) {
                        //             return GestureDetector(
                        //               onTap: () {},
                        //               child: Container(
                        //                 width: 50,
                        //                 height: 50,
                        //                 // color: Colors.amber,
                        //                 alignment: Alignment.center,
                        //                 child: _featuresTextStyle(_listFeatures[index].name, _listFeatures[index].icon),
                        //               ),
                        //             );
                        //           }),
                        //         );
                        //       }),
                        // ),
                        SizedBox(
                          height: 10,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                                },
                                child: AnimatedContainer(
                                  width: selectedIndex == index ? 28 : 10,
                                  height: 10,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  duration: const Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedIndex == index ? const Color(0xff5289F4) : const Color(0xffDDDDDD),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     _featuresTextStyle('QR Pay', AppIcons.iconQRPay),
                        //     _featuresTextStyle('ATM', AppIcons.iconATM),
                        //     _featuresTextStyle('book_tickets'.tr(), AppIcons.iconTicket),
                        //     _featuresTextStyle('support'.tr(), AppIcons.iconSupport),
                        //   ],
                        // ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<Widget> list() {
  //   _listFeatures =
    // return _listFeatures;
  // }


  Widget _featuresTextStyle(String title, String icon) {
    return Column(
      children: [
        SvgPicture.asset(icon),
        Expanded(
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.textFeatures.copyWith(height: 1.2)
            ),
          ),
        )
      ],
    );
  }

}

class Model {
  final String name;
  final String icon;
   const Model(this.name, this.icon);
}