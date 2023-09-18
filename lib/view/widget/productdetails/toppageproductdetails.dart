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
                child: Stack(
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
                    Positioned(
                      bottom: 0,
                      left: Get.width / 4,
                      child: AnimatedContainerImages(),
                    ),
                    Positioned(
                      top: 15,
                      left: Get.width / 1.3,
                      child: InkWell(
                        onTap: () async {
                          await controller.getUserRate();
                          Get.defaultDialog(
                              title: "152".tr,
                              content: GetX<ProductDetailsControllerImp>(
                                  builder: ((controller1) => Column(
                                        children: [
                                          Text(
                                            "153".tr,
                                            style: TextStyle(
                                                color: AppColor.grey2),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ...List.generate(5, (index) {
                                                return IconButton(
                                                    onPressed: () {
                                                      controller1
                                                          .ratedialog(index);
                                                      print(
                                                          controller.rateUser);
                                                    },
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 30,
                                                      color: index + 1 <=
                                                              controller1
                                                                  .rateUser
                                                                  .value
                                                          ? Colors.yellow
                                                          : Colors.black,
                                                    ));
                                              })
                                            ],
                                          )
                                        ],
                                      ))));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.rate == 0
                                      ? "--"
                                      : "${controller.rate.toStringAsFixed(1)}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 0.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                )
                              ]),
                        ),
                      ),
                    ),
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
