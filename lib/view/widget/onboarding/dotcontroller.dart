import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: GetBuilder<OnBoardingControllerImp>(
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    width: index == controller.currentPage ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primaryColor),
                  ),
                )
              ],
            );
          },
        ));
  }
}
