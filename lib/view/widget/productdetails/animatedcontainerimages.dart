import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedContainerImages extends GetView<ProductDetailsControllerImp> {
  const AnimatedContainerImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          controller.images.length,
          (index) => AnimatedContainer(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 700),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageitems}/${controller.images[index]['itemsimages_name']}",
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: controller.currentImage == index
                    ? Border.all(color: AppColor.primaryColor, width: 1.2)
                    : null,
                color: controller.currentImage == index
                    ? AppColor.grey3
                    : Colors.white),
          ),
        )
      ],
    );
  }
}
