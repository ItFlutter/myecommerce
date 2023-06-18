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
        // Container(
        //   height: 180,
        //   decoration: const BoxDecoration(
        //     color: AppColor.primaryColor,
        //   ),
        // ),
        Container(
          height: 300,
          width: double.infinity,
          color: AppColor.grey3,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Hero(
              tag: controller.itemsModel.itemsId!,
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
