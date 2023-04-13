import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            width: 80,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.fourthColor),
                color: controller.subItems[index]['active'] == "1"
                    ? AppColor.fourthColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Text("${controller.subItems[index]['name']}",
                style: TextStyle(
                    color: controller.subItems[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.fourthColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
        )
      ],
    );
  }
}
