import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 150,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            // left: controller.lang == "en" ? 210 : null,
            right: controller.lang == "ar" ? 210 : -25,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: AppColor.secondryColor),
            ),
          ),
        ],
      ),
    );
  }
}
