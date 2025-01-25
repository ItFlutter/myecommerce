import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerce/view/widget/productdetails/toppageproductdetails.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        height: 60,
        child: MaterialButton(
          color: AppColor.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Text(
            "135".tr,
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(children: [
                const TopProductPageDetails(),
                // const SizedBox(
                //   height: 80,
                // ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.itemsModel.itemsName}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              count: "${controller.countitems}",
                              price:
                                  "${controller.itemsModel.itemsPriceDiscount}"),
                          const SizedBox(
                            height: 10,
                          ),
                          ReadMoreText(
                            "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                            trimCollapsedText: "142".tr,
                            trimExpandedText: "143".tr,
                            trimLines: 4,
                            trimMode: TrimMode.Line,
                            style: Theme.of(context).textTheme.bodyMedium,
                            colorClickableText: AppColor.primaryColor,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "Color",
                          //   style: Theme.of(context).textTheme.headline1!.copyWith(
                          //       color: AppColor.fourthColor, fontSize: 22),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // const SubItemsList(),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   right: 0,
                    //   bottom: 180,
                    //   child: Container(
                    //     width: 75,
                    //     height: 55,
                    //     decoration: BoxDecoration(
                    //         color: AppColor.thridColor.withOpacity(0.5),
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(25),
                    //             bottomLeft: Radius.circular(20))),
                    //     // alignment: Alignment.centerRight,
                    //     child: Icon(
                    //       Icons.favorite,
                    //       color: controller.itemsModel.favorite == "1"
                    //           ? AppColor.thridColor
                    //           : AppColor.grey2,
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ]))),
    );
  }
}
