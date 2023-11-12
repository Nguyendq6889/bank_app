import 'package:bank_app/app_assets/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_colors.dart';
import '../app_assets/app_icons.dart';
import '../app_assets/app_styles.dart';
import '../screens/news_screen.dart';
import '../screens/transfer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _featuresPageController = PageController(initialPage: 0);
  final PageController _bannerPageController = PageController(initialPage: 0);
  int _selectedFeaturesPage = 0;
  int _selectedBannerPage = 0;

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
                        'currency'.tr(),
                        style: AppStyles.textButtonWhite.copyWith(fontWeight: FontWeight.w400)
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
// Features
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'features'.tr(),
                              style: AppStyles.textButtonBlack
                            ),
                          ),
                          InkWell(
                            onTap: () => _showModalBottomSheet(),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'all'.tr(),
                                style: AppStyles.textButtonBlue
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      ExpandablePageView(
                        controller: _featuresPageController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (index){
                          setState(() {
                            _selectedFeaturesPage = index;
                          });
                        },
                        children: [
                          GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            // padding: EdgeInsets.zero,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 12,
                            crossAxisCount: 4,
                            children: <Widget>[
                              _featuresTextStyle(
                                'transfer'.tr(),
                                AppIcons.iconTransfer,
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TransferScreen())),
                              ),
                              _featuresTextStyle('payment'.tr(), AppIcons.iconPayment),
                              _featuresTextStyle('saving'.tr(), AppIcons.iconSaving),
                              _featuresTextStyle('payment_request'.tr(), AppIcons.iconPaymentRequest),
                              _featuresTextStyle('account'.tr(), AppIcons.iconWallet),
                              _featuresTextStyle('card_service'.tr(), AppIcons.iconCards),
                              _featuresTextStyle('insurance'.tr(), AppIcons.iconInsurance),
                              _featuresTextStyle('top_up'.tr(), AppIcons.iconTopUp),
                            ],
                          ),
                          GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 12,
                            crossAxisCount: 4,
                            children: <Widget>[
                              _featuresTextStyle('atm_branch'.tr(), AppIcons.iconATMHome),
                              _featuresTextStyle('withdraw'.tr(), AppIcons.iconWithdraw),
                              _featuresTextStyle('interest_rate'.tr(), AppIcons.iconInterestRate),
                              _featuresTextStyle('exchange_rate'.tr(), AppIcons.iconExchangeRate),
                              _featuresTextStyle('promotion'.tr(), AppIcons.iconPromotion),
                              _featuresTextStyle('book_tickets'.tr(), AppIcons.iconTicketHome),
                              _featuresTextStyle('support'.tr(), AppIcons.iconSupportHome),
                              _featuresTextStyle('news'.tr(), AppIcons.iconNews),
                            ],
                          ),
                        ]
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 10,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                _featuresPageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                              },
                              child: AnimatedContainer(
                                width: _selectedFeaturesPage == index ? 28 : 10,
                                height: 10,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                duration: const Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedFeaturesPage == index ? const Color(0xff5289F4) : const Color(0xffDDDDDD),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
// News
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'news'.tr(),
                              style: AppStyles.textButtonBlack
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NewsScreen())),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'all'.tr(),
                                style: AppStyles.textButtonBlue
                              ),
                            ),
                          )
                        ],
                      ),
                      ExpandablePageView(
                        controller: _bannerPageController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (index){
                          setState(() {
                            _selectedBannerPage = index;
                          });
                        },
                        children: [
                          _banner(AppImages.imageBanner, size),
                          _banner(AppImages.imageBanner2, size),
                          _banner(AppImages.imageBanner3, size),
                          _banner(AppImages.imageBanner4, size),
                        ]
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 10,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                _bannerPageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                              },
                              child: AnimatedContainer(
                                width: _selectedBannerPage == index ? 28 : 10,
                                height: 10,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                duration: const Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedBannerPage == index ? const Color(0xff5289F4) : const Color(0xffDDDDDD),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 26),
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

  _showModalBottomSheet() {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.77,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'features'.tr(),
                      style: AppStyles.textButtonBlack.copyWith(fontSize: 16)
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: SvgPicture.asset(AppIcons.iconClose),
                    ),
                  )
                ],
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                childAspectRatio: 1.4,
                mainAxisSpacing: 12,
                crossAxisCount: 4,
                children: <Widget>[
                  _featuresTextStyle(
                    'transfer'.tr(),
                    AppIcons.iconTransfer,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TransferScreen())),
                  ),
                  _featuresTextStyle('payment'.tr(), AppIcons.iconPayment),
                  _featuresTextStyle('saving'.tr(), AppIcons.iconSaving),
                  _featuresTextStyle('payment_request'.tr(), AppIcons.iconPaymentRequest),
                  _featuresTextStyle('account'.tr(), AppIcons.iconWallet),
                  _featuresTextStyle('card_service'.tr(), AppIcons.iconCards),
                  _featuresTextStyle('insurance'.tr(), AppIcons.iconInsurance),
                  _featuresTextStyle('top_up'.tr(), AppIcons.iconTopUp),
                  _featuresTextStyle('atm_branch'.tr(), AppIcons.iconATMHome),
                  _featuresTextStyle('withdraw'.tr(), AppIcons.iconWithdraw),
                  _featuresTextStyle('interest_rate'.tr(), AppIcons.iconInterestRate),
                  _featuresTextStyle('exchange_rate'.tr(), AppIcons.iconExchangeRate),
                  _featuresTextStyle('promotion'.tr(), AppIcons.iconPromotion),
                  _featuresTextStyle('book_tickets'.tr(), AppIcons.iconTicketHome),
                  _featuresTextStyle('support'.tr(), AppIcons.iconSupportHome),
                  _featuresTextStyle('news'.tr(), AppIcons.iconNews),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _featuresTextStyle(String title, String icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }

  Widget _banner(String image, Size size) {
    return Container(
      height: size.height * 26.108 / 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(image), fit: BoxFit.cover,
        )
      ),
    );
  }
}