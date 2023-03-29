import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1".tr,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonLang(
            text: "2".tr,
            onPressed: () {
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            },
          ),
          CustomButtonLang(
            text: "3".tr,
            onPressed: () {
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);
            },
          ),
        ],
      ),
    );
  }
}
