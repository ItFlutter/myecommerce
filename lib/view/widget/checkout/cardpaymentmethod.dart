import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondryColor : AppColor.thridColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive ? Colors.white : AppColor.secondryColor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
