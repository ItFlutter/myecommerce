import 'package:ecommerce/view/screen/home.dart';
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
      children: const [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favorite"),
        )
      ],
    ),
  ];
  List titlebottomappbar = ["home", "settings", "profile", "favorite"];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
