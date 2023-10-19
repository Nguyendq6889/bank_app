import 'package:bank_app/app_assets/app_icons.dart';
import 'package:bank_app/app_assets/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_assets/app_icons.dart';
import 'account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle selectedLabelStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 1.6);
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Business',
      style: optionStyle,
    ),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // selectedFontSize: 14,
        selectedLabelStyle: selectedLabelStyle,
        // unselectedFontSize: 14,
        unselectedLabelStyle: selectedLabelStyle,
        selectedItemColor: const Color(0XFF5289F4),
        unselectedItemColor: const Color(0xffC4C4C4),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.iconHomeBlue),
            icon: SvgPicture.asset(AppIcons.iconHomeGray),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.iconTransactionsBlue),
            icon: SvgPicture.asset(AppIcons.iconTransactionsGray),
            label: 'Giao dịch',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.iconQRPay, width: 22),
            icon: SvgPicture.asset(AppIcons.iconQrGray),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.iconNotificationsHomeBlue),
            icon: SvgPicture.asset(AppIcons.iconNotificationsHomeGray),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.iconAccountBlue),
            icon: SvgPicture.asset(AppIcons.iconAccountGray),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
