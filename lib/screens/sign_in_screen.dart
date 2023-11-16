import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_assets/app_colors.dart';
import '../app_assets/app_icons.dart';
import '../app_assets/app_images.dart';
import '../app_assets/app_styles.dart';
import '../widgets/language_option_widget.dart';
import '../widgets/main_button_widget.dart';
import 'main_screens/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _language;
  late final LocalAuthentication auth;
  bool _supportState = false;
  List<BiometricType> availableBiometrics = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    auth = LocalAuthentication();
    _getLanguage();
    _getAvailableBiometrics();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
        _supportState = isSupported;
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
            gradient: AppColors.colorAppBar,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: double.infinity, height: MediaQuery.of(context).padding.top),
                        InkWell(
                          onTap: () => _showModalBottomSheet(),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(_language == 'vi_VN' ? AppIcons.iconVietNam : AppIcons.iconEnglish),
                                const SizedBox(width: 6),
                                Text(
                                  _language == 'vi_VN' ? 'VI' : 'EN',
                                  style: AppStyles.textButtonWhite.copyWith(fontWeight: FontWeight.bold)
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
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
                            _feature('QR Pay', AppIcons.iconQRPay),
                            _feature('ATM', AppIcons.iconATM),
                            _feature('book_tickets'.tr(), AppIcons.iconTicket),
                            _feature('support'.tr(), AppIcons.iconSupport),
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
                        flex: 2,
                        child: SvgPicture.asset(AppImages.imageLogoVisa),
                      ),
                      Expanded(
                        flex: 5,
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
                                    cursorColor: AppColors.primaryColor,
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
                                margin: EdgeInsets.only(bottom: size.height * 2.5 / 100),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff7f6f6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    style: AppStyles.textNormalBlack,
                                    cursorColor: AppColors.primaryColor,
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
                              if(_supportState) GestureDetector(
                                onTap: () {
                                  _authenticate();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    availableBiometrics.contains(BiometricType.face)
                                        ? SvgPicture.asset(AppIcons.iconFaceID, colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn))
                                        : SvgPicture.asset(AppIcons.iconFingerprint),
                                    const SizedBox(width: 12),
                                    Text(
                                        availableBiometrics.contains(BiometricType.face)
                                            ? 'Face ID'
                                            : 'Touch ID',
                                      style: AppStyles.textButtonBlack.copyWith(fontWeight: FontWeight.w600)
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 2.5 / 100),
                              MainButtonWidget(text: 'sign_in'.tr(), onTap: () => _goToMainScreen()),
                              SizedBox(height: size.height * 2.5 / 100),
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

  Widget _feature(String title, String icon) {
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

  _showModalBottomSheet() {
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
          height: 30 * MediaQuery.of(context).size.height / 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'select_language'.tr(),
                      style: AppStyles.titleAppBarBlack.copyWith(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                      child: SvgPicture.asset(AppIcons.iconClose),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'language_use_question'.tr(),
                  style: AppStyles.textButtonGray,
                ),
              ),
              const SizedBox(height: 12),
              LanguageOptionWidget(
                icon: AppIcons.iconVietNam,
                label: 'Tiếng Việt',
                selected: (_language == 'vi_VN') ? true : false,
                onTap: () {
                  context.setLocale(const Locale('vi', 'VN'));
                  _saveLanguage('vi_VN');
                  Navigator.pop(context);
                },
              ),
              LanguageOptionWidget(
                icon: AppIcons.iconEnglish,
                label: 'English',
                selected: (_language == 'en_US') ? true : false,
                onTap: (){
                  context.setLocale(const Locale('en', 'US'));
                  _saveLanguage('en_US');
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedLanguage = prefs.getString('language') ?? 'en_US';
    setState(() {
      _language = savedLanguage;
    });
  }

  Future<void> _saveLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newLanguage);
    setState(() {
      _language = newLanguage;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    availableBiometrics = await auth.getAvailableBiometrics();
    if (kDebugMode) {
      print('List of availableBiometrics: $availableBiometrics');
    }
    if (!mounted) {
      return;
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MainScreen()));
  }
}