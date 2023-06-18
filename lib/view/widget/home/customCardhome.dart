import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String? title;
  final String? body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
      height: 150,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                title!,
                textDirection: TextDirection.ltr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              subtitle: Text(
                body!,
                textDirection: TextDirection.ltr,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 170,
            // right: controller.lang == "ar" ? 210 : null,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.white10),
            ),
          ),
          Positioned(
            bottom: -190,
            // right: controller.lang == "ar" ? 100 : null,
            // right: controller.lang == "ar" ? 210 : null,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.white10),
            ),
          ),
        ],
      ),
    );
  }
}
