import 'package:bank_app/app_assets/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

import '../app_assets/app_icons.dart';
import '../app_assets/app_styles.dart';
import '../widgets/main_button_widget.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LocalAuthentication auth;
  // bool _supportState = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
        // _supportState = isSupported;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: AppStyles.colorAppBar,
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
                            _featuresTextStyle('book_tickets'.tr(), AppIcons.iconTicket),
                            _featuresTextStyle('support'.tr(), AppIcons.iconSupport),
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
                    child: GestureDetector(
                      onTap: () {
                        // print("Đăng ký tạo tài khoản");
                      },
                      child: Text(
                        'sign_up'.tr(),
                        textAlign: TextAlign.center,
                        style: AppStyles.textButtonWhite.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 44,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff7f6f6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: _userNameController,
                                    style: AppStyles.textNormalBlack,
                                    cursorColor: AppStyles.primaryColor,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: '${'username'.tr()} / ${'phone_number'.tr()}',
                                        hintStyle: const TextStyle(
                                        fontSize: 14, color: Color(0xffA1A1A1), fontWeight: FontWeight.w400
                                      ),
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
                              Container(
                                width: double.infinity,
                                height: 44,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff7f6f6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    style: AppStyles.textNormalBlack,
                                    cursorColor: AppStyles.primaryColor,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: 'password'.tr(),
                                        hintStyle: const TextStyle(
                                        fontSize: 14, color: Color(0xffA1A1A1), fontWeight: FontWeight.w400
                                      )
                                    ),
                                    onChanged: (value) {
                                      // print(_passwordController.text.trim());
                                    },
                                    onTapOutside: (PointerDownEvent event) {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    },
                                  ),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     _getAvailableBiometrics();
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       SvgPicture.asset(AppIcons.iconFingerprint),
                              //       const SizedBox(width: 12),
                              //       Text(
                              //         "Touch ID",
                              //         style: AppStyles.textButtonBlack.copyWith(fontWeight: FontWeight.w600)
                              //       )
                              //     ],
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  _authenticate();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppIcons.iconFingerprint),
                                    const SizedBox(width: 12),
                                    Text(
                                      "Touch ID",
                                      style: AppStyles.textButtonBlack.copyWith(fontWeight: FontWeight.w600)
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              MainButtonWidget(text: 'sign_in'.tr(), onTap: () => _goToMainScreen()),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  // print('Quên mật khẩu?');
                                },
                                child: Text(
                                  'forgot_password'.tr(),
                                  style: AppStyles.textButtonBlue.copyWith(height: 1.5, decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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
          style: AppStyles.textFeatures.copyWith(fontSize: 13)
        )
      ],
    );
  }

  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
  //   if (kDebugMode) {
  //     print('List of availableBiometrics: $availableBiometrics');
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  // }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        // localizedReason: 'Let OS determine authentication method',
        localizedReason: 'text_use_finger'.tr(),
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true
        ),
      );
      if (kDebugMode) {
        print('Authenticated: $authenticated');
      }
      if(authenticated) {
        _goToMainScreen();
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _goToMainScreen() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const MainScreen()), (route) => false);
  }
}
