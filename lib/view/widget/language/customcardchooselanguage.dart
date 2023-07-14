import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/language/customradiochooselanguage.dart';
import 'package:ecommerce/view/widget/language/customsubtitlecardchooselanguage.dart';
import 'package:ecommerce/view/widget/language/customtitlecardchooselanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardChooseLanguage extends StatelessWidget {
  const CustomCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleCardChooseLanguage(),
            CustomSubtitleCardChooseLanguage(),
            const SizedBox(
              height: 20,
            ),
            CustomRadioChooseLanguage(
                tiltle: "3".tr, assetName: AppImageAsset.english, value: "en"),
            Divider(
              thickness: 0.9,
              height: 20,
            ),
            CustomRadioChooseLanguage(
                tiltle: "2".tr, assetName: AppImageAsset.arabic, value: "ar"),
          ],
        ),
      ),
    );
  }
}
