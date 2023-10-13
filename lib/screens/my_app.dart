import 'package:bank_app/app_assets/app_styles.dart';
import 'package:bank_app/widgets/item_in_payment_widget.dart';
import 'package:bank_app/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_assets/app_icons.dart';
import '../app_assets/app_images.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nguyen', style: AppStyles.titleAppBarWhite),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Bằng cách mở thẻ đồng thương hiệu Ngân hàng'),
            Image.asset(AppImages.imageBanner),
            SvgPicture.asset(AppIcons.iconQRPay),
            MainButtonWidget(
              text: 'quay laij',
              onTap: () {
                print('22222');
              },
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemInPaymentWidget(
                  onTap: () {
                    print(1111);
                  },
                  text: 'Trong ngân hàng',
                  icon: AppIcons.iconInternalBank,
                ),
                ItemInPaymentWidget(
                  onTap: () {
                    print(1111);
                  },
                  text: 'Liên ngân hàng',
                  icon: AppIcons.iconExternalBank,
                ),
                ItemInPaymentWidget(
                  onTap: () {
                    print(1111);
                  },
                  text: 'Vé máy bay',
                  icon: AppIcons.iconAirplane,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}