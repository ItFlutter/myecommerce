import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  MyServices myservices = Get.find();
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage == onBoardingList.length) {
      myservices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
