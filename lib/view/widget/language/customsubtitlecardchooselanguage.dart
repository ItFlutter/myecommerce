import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubtitleCardChooseLanguage extends StatelessWidget {
  const CustomSubtitleCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text("151".tr,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: AppColor.grey)),
    );
  }
}
