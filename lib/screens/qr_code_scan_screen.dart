import 'dart:developer';
import 'dart:io';

import 'package:bank_app/app_assets/app_icons.dart';
import 'package:bank_app/screens/qr_code_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../app_assets/app_styles.dart';

class QRCodeScanScreen extends StatefulWidget {
  const QRCodeScanScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScanScreen> createState() => _QRCodeScanScreenState();
}

class _QRCodeScanScreenState extends State<QRCodeScanScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'qr_code_scan'.tr(),
          style: AppStyles.titleAppBarWhite.copyWith(height: 1, fontSize: 18)
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          // iconSize: 18.0,
          icon: SvgPicture.asset(AppIcons.iconBack),
        )
      ),
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            left: 32,
            bottom: 16,
            child: SafeArea(
              child: Container(
                width: size.width - 64,
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AppIcons.iconLightBulb),
                              const SizedBox(height: 6),
                              Text(
                                'turn_on_flash'.tr(),
                                style: AppStyles.textFeatures.copyWith(fontSize: 13)
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           SvgPicture.asset(AppIcons.iconImage),
                           const SizedBox(height: 6),
                           Text(
                             'select_qr_photo'.tr(),
                             style: AppStyles.textFeatures.copyWith(fontSize: 13)
                           )
                         ],
                       ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 5,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'move_camera'.tr(),
                textAlign: TextAlign.center,
                style: AppStyles.textButtonWhite
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width - 96;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Navigator.pushReplacement<void, void>(context, MaterialPageRoute<void>(builder: (BuildContext context) => const QRCodeInfo()));
      // Navigator.pushReplacement(context, EnterExitRoute(enterPage: const QRCodeInfo()));
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget? exitPage;
  EnterExitRoute({this.exitPage, required this.enterPage})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    enterPage,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}
