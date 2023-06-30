import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
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
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 80, left: 20, right: 20),
                      alignment: Alignment.topLeft,
                      child: Image.asset(AppImageAsset.translate,
                          alignment: Alignment.topLeft,
                          height: 120,
                          width: 120)),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text("150".tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.black.withOpacity(0.7))),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text("151".tr,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.grey)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          RadioListTile(
                              activeColor: AppColor.primaryColor,
                              // isThreeLine: true,
                              secondary: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImageAsset.english)),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text("3".tr),
                              value: "en",
                              groupValue: controller.lang,
                              onChanged: (String? val) {
                                controller.lang = val!;
                                controller.changeLang(val);
                              }),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Divider(
                            thickness: 0.9,
                            height: 20,
                          ),
                          RadioListTile(
                              activeColor: AppColor.primaryColor,

                              // isThreeLine: true,
                              secondary: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImageAsset.arabic)),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text("2".tr),
                              value: "ar",
                              groupValue: controller.lang,
                              onChanged: (String? val) {
                                controller.lang = val!;
                                controller.changeLang(val);
                              }),
                        ],
                      ),
                    ),
                  )
                  // CustomButtonLang(
                  //   text: "2".tr,
                  //   onPressed: () {
                  //     controller.changeLang("ar");
                  //     Get.toNamed(AppRoute.onBoarding);
                  //   },
                  // ),
                ],
              ),
            );
          },
        ));
  }
}
