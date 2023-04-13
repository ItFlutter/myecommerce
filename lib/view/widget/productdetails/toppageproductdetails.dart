import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondryColor,
          ),
        ),
        Positioned(
          top: 30,
          right: Get.width / 9,
          left: Get.width / 9,
          child: Hero(
            tag: controller.itemsModel.itemsId!,
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
              height: 240,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
