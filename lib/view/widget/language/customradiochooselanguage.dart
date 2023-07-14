import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioChooseLanguage extends GetView<LocaleController> {
  final String tiltle;
  final String assetName;
  final String value;
  const CustomRadioChooseLanguage(
      {Key? key,
      required this.tiltle,
      required this.assetName,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        activeColor: AppColor.primaryColor,
        // isThreeLine: true,
        secondary: CircleAvatar(backgroundImage: AssetImage(assetName)),
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(tiltle),
        value: value,
        groupValue: controller.lang,
        onChanged: (String? val) {
          controller.lang = val!;
          controller.changeLang(val);
        });
  }
}
