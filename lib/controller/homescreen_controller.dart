import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("63".tr),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("64".tr),
        )
      ],
    ),
    const Settingss()
  ];
  List bottomappbar = [
    {
      "title": "62".tr,
      "icon": Icons.home,
    },
    {
      "title": "69".tr,
      "icon": Icons.notifications_active_outlined,
    },
    {
      "title": "64".tr,
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": "63".tr,
      "icon": Icons.settings,
    },
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
