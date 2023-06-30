import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = const [
    HomePage(),
    // NotificationView(),
    MyFavorite(),
    OffersView(),
    Settingss()
  ];
  List bottomappbar = [
    {
      "title": "62".tr,
      "icon": Icons.home,
    },
    {
      "title": "69".tr,
      "icon": Icons.favorite_border_outlined,
    },
    {
      "title": "128".tr,
      "icon": Icons.offline_bolt_outlined,
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
