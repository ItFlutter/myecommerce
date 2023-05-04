import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColor.thridColor),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.primaryColor),
      ),
    );
  }
}
