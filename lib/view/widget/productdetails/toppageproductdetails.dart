import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/productdetails/animatedcontainerimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => controller.images.isNotEmpty
            ? Container(
                padding: EdgeInsets.only(bottom: 20),
                color: AppColor.grey3,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 230.0,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              controller.onImageChanged(index);
                            }),
                        itemCount: controller.images.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                              // width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 30),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageitems}/${controller.images[itemIndex]['itemsimages_name']}",
                                fit: BoxFit.fill,
                              ),
                            )),
                    AnimatedContainerImages(),
                  ],
                ),
              )
            : Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
              ));

    // return Stack(
    //   clipBehavior: Clip.none,
    //   children: [
    //     // Container(
    //     //   height: 180,
    //     //   decoration: const BoxDecoration(
    //     //     color: AppColor.primaryColor,
    //     //   ),
    //     // ),
    //     Container(
    //       height: 300,
    //       width: double.infinity,
    //       color: AppColor.grey3,
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    //         child: Hero(
    //           tag: controller.itemsModel.itemsId!,
    //           child: CachedNetworkImage(
    //             imageUrl:
    //                 "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
