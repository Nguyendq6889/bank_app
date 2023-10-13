import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInPaymentWidget extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;
  const ItemInPaymentWidget({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 108,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8, // soften the shadow
            spreadRadius: 0, //extend the shadow
          )
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                  child: Center(child: SvgPicture.asset(icon))
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
