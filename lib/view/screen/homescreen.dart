import 'dart:io';

import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: const Icon(Icons.shopping_cart),
          ),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentPage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "47".tr,
                  middleText: "48".tr,
                  onConfirm: () {
                    exit(0);
                  },
                  onCancel: () {},
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                  cancelTextColor: AppColor.secondryColor,
                  confirmTextColor: AppColor.secondryColor,
                  buttonColor: AppColor.thridColor,
                );
                return Future.value(true);
              })),
    );
  }
}
