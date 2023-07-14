import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/language/customcardchooselanguage.dart';
import 'package:ecommerce/view/widget/language/customradiochooselanguage.dart';
import 'package:ecommerce/view/widget/language/customsubtitlecardchooselanguage.dart';
import 'package:ecommerce/view/widget/language/customtitlecardchooselanguage.dart';
import 'package:ecommerce/view/widget/language/customtoplanguagelogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomButtonLang(
          text: "96".tr,
          onPressed: () {
            controller.changeLang(controller.lang);
            Get.toNamed(AppRoute.onBoarding);
          },
        ),
        body: GetBuilder<LocaleController>(
          builder: (controller) {
            return Container(
              margin: EdgeInsets.only(
                top: 90,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [CustomTopLanguageLogo(), CustomCardChooseLanguage()],
              ),
            );
          },
        ));
  }
}
