import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleCardChooseLanguage extends StatelessWidget {
  const CustomTitleCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text("150".tr,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColor.black.withOpacity(0.7))),
    );
  }
}
