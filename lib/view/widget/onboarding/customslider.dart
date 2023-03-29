import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "${onBoardingList[i].image}",
                  width: double.infinity,
                  height: 300,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "${onBoardingList[i].title}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColor.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${onBoardingList[i].body}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.7,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          );
        });
  }
}
