import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_assets/app_colors.dart';
import '../../app_assets/app_icons.dart';
import '../../app_assets/app_styles.dart';
import '../../widgets/main_button_widget.dart';

class InterbankTransferScreen extends StatefulWidget {
  const InterbankTransferScreen({Key? key}) : super(key: key);

  @override
  State<InterbankTransferScreen> createState() => _InterbankTransferScreenState();
}

class _InterbankTransferScreenState extends State<InterbankTransferScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumberOrCardNumberCtrl = TextEditingController();
  final TextEditingController _amountMoneyCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  bool isSwitched = true;
  String? selectedBank;
  String selectedFeePayer = 'sender'.tr();
  String selectedCurrency = 'currency'.tr();

  List<String> listBanks = [
    'Bank of America (BoA)',
    'The Bank of Tokyo - Mitsubishi UFJ.LTD (MUFG)',
    'HSBC Holdings Plc',
    'BNP Paribas',
    'Crédit Agricole',
  ];
  List<String> listCurrency = ['VNĐ', 'USD',];
  List<String> listFeePayer = ['sender'.tr(), 'receiver'.tr()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: const Color(0xff4E86F3),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // AppBar
              Container(
                width: size.width,
                height: 105,
                decoration: const BoxDecoration(
                  gradient: AppColors.colorAppBar,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SvgPicture.asset(AppIcons.iconBack),
                            ),
                          ),
                          Text('interbank_transfer'.tr(), style: AppStyles.titleAppBarWhite.copyWith(height: 1)),
                          const SizedBox(width: 42)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 68, 16, 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'to'.tr(),
                            style: AppStyles.textButtonBlack
                          ),
                          Container(
                            width: double.infinity,
                            height: 44,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xfff7f6f6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: _accountNumberOrCardNumberCtrl,
                                keyboardType: TextInputType.number,
                                style: AppStyles.textNormalBlack,
                                cursorColor: AppColors.primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  hintText: '${'account_number'.tr()} / ${'card_number'.tr()}',
                                  hintStyle: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1)),
                                ),
                                onChanged: (value) {
                                  // print(_userNameController.text.trim());
                                },
                                onTapOutside: (PointerDownEvent event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _modalBottomSheet(listData: listBanks, valueType: 'select_bank', currentValue: selectedBank),
                            child: Container(
                              width: double.infinity,
                              height: 44,
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.only(left: 12, right: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xfff7f6f6),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedBank ?? 'select_bank'.tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: selectedBank != null
                                          ? AppStyles.textNormalBlack
                                          : AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1)),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(AppIcons.iconArrowDownBlue)
                                ],
                              )
                            ),
                          ),
                          Text(
                            'transfer_info'.tr(),
                            style: AppStyles.textButtonBlack
                          ),
                          Container(
                            width: double.infinity,
                            height: 44,
                            padding: const EdgeInsets.fromLTRB(12, 6, 0, 6),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xfff7f6f6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _amountMoneyCtrl,
                                    maxLength: 13,
                                    keyboardType: TextInputType.number,
                                    style: AppStyles.textNormalBlack,
                                    cursorColor: AppColors.primaryColor,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: 'transfer_amount'.tr(),
                                      hintStyle: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1)),
                                    ),
                                    onChanged: (value) {
                                      // print(_passwordController.text.trim());
                                    },
                                    onTapOutside: (PointerDownEvent event) {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    },
                                  ),
                                ),
                                const VerticalDivider(thickness: 1, width: 1, color: Color(0xffD7DBE6)),
                                InkWell(
                                  onTap: () => _modalBottomSheet(
                                    listData: listCurrency,
                                    valueType: 'select_currency',
                                    currentValue: selectedCurrency,
                                    height: 30,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12, right: 16, top: 6, bottom: 6),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedCurrency,
                                          style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff5289F4)),
                                        ),
                                        const SizedBox(width: 8),
                                        SvgPicture.asset(AppIcons.iconArrowDownBlue),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => _modalBottomSheet(
                              listData: listFeePayer,
                              valueType: 'select_fee_payer',
                              currentValue: selectedFeePayer,
                              height: 30,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 44,
                              padding: const EdgeInsets.only(left: 12, right: 16),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xfff7f6f6),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'charged_to'.tr(),
                                    style: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1)),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    selectedFeePayer,
                                    style: AppStyles.textNormalBlack.copyWith(color: const Color(0xff5289F4)),
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(AppIcons.iconArrowDownBlue)
                                ],
                              )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'save_beneficiary'.tr(),
                                style: AppStyles.textButtonBlack.copyWith(height: 1)
                              ),
                              SizedBox(
                                height: 24,
                                width: 40,
                                child: Switch(
                                  value: isSwitched,
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeTrackColor: const Color(0xffd2e1ff),
                                  activeColor: const Color(0xff5289F4),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: size.height * 10.837 / 100,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xfff7f6f6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextFormField(
                              controller: _descriptionCtrl,
                              maxLines: null,
                              style: AppStyles.textNormalBlack,
                              cursorColor: AppColors.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                isCollapsed: true,
                                border: InputBorder.none,
                                hintText: 'description'.tr(),
                                hintStyle: AppStyles.textNormalBlack.copyWith(color: const Color(0xffA1A1A1)),
                              ),
                              onChanged: (value) {
                                // print(_userNameController.text.trim());
                              },
                              onTapOutside: (PointerDownEvent event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ),
                          MainButtonWidget(text: 'transfer'.tr(), onTap: () {}),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 52,
            child: Container(
              width: size.width - 32,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 8, // soften the shadow
                    spreadRadius: 0, //extend the shadow
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'transfer_from'.tr(),
                        style: AppStyles.textButtonBlack,
                      ),
                      Text(
                        'change'.tr(),
                        style: AppStyles.textButtonBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${'account'.tr()}:',
                          style: AppStyles.textFeatures.copyWith(color: const Color(0xff888888), fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${'balance'.tr()}:',
                          style: AppStyles.textFeatures.copyWith(color: const Color(0xff888888), fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          '1014686229',
                          style: AppStyles.textButtonBlack,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '15.200.000 ${'currency'.tr()}',
                          style: AppStyles.textButtonBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _modalBottomSheet({required List<String> listData, required String valueType, required String? currentValue, int? height}) {
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
          height: (height ?? 50) * MediaQuery.of(context).size.height / 100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(valueType.tr(), style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16)),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(AppIcons.iconClose),
                    ),
                  )
                ],
              ),
              const Divider(color: Color(0xfff1f1f1), height: 1.0, thickness: 1, indent: 16, endIndent: 16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      ...List.generate(listData.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if(listData == listBanks) {
                                selectedBank = listData[index];
                              } else if(listData == listFeePayer) {
                                selectedFeePayer = listData[index];
                              } else {
                                selectedCurrency = listData[index];
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                            color: (listData[index] == currentValue) ? const Color(0xfff1f1f1) : null,
                            child: Row(
                              children: [
                                SizedBox(width: (listData[index] == currentValue) ? 15 : 0),
                                Expanded(
                                  child: Text(
                                    listData[index],
                                    // overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.textButtonBlack.copyWith(color: const Color(0xff666666), height: 1)
                                  ),
                                ),
                              (listData[index] == currentValue) ? SvgPicture.asset(AppIcons.iconSelected) : const SizedBox(),
                              ],
                            ),
                          )
                        );
                      })
                    ]
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}