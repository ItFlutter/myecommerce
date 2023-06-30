import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class CustomCardtheNewestItems extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const CustomCardtheNewestItems({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            controller.goToPageProductDetails(itemsModel);
          },
          child: Container(
            width: 200,
            child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                          width: 130,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                              "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.black.withOpacity(0.8),
                                  fontWeight: controller
                                              .myServices.sharedPreferences
                                              .getString("lang") ==
                                          "en"
                                      ? FontWeight.w800
                                      : FontWeight.w700)),
                        ),
                      ),
                      Text(
                          "${translateDatabase(itemsModel.categoriesNameAr, itemsModel.categoriesName)}",
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold)),
                      // Container(
                      //   height: 30,
                      //   alignment: Alignment.bottomCenter,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "66".tr,
                      //       ),
                      //       Row(
                      //         children: [
                      //           ...List.generate(
                      //               5,
                      //               (index) => const Padding(
                      //                     padding: EdgeInsets.only(top: 7.0),
                      //                     child: Icon(
                      //                       Icons.star,
                      //                       size: 13,
                      //                     ),
                      //                   ))
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${itemsModel.itemsPriceDiscount!}\$",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<FavoriteControllerImp>(
                            builder: (controller2) => IconButton(
                                onPressed: () {
                                  if (controller2
                                          .isFavorite[itemsModel.itemsId] ==
                                      "1") {
                                    controller2.setFavorite(
                                        itemsModel.itemsId!, "0");

                                    controller2
                                        .removeFavorite(itemsModel.itemsId!);
                                  } else {
                                    controller2.setFavorite(
                                        itemsModel.itemsId!, "1");
                                    controller2
                                        .addFavorite(itemsModel.itemsId!);
                                  }
                                  // controller.setFavorite(
                                  //     itemsModel.itemsId!,
                                  //     controller.isFavorite[itemsModel.itemsId] == "1"
                                  //         ? "0"
                                  //         : "1");
                                },
                                icon: Icon(
                                  controller2.isFavorite[itemsModel.itemsId] ==
                                          "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        itemsModel.itemsDiscount != "0"
            ? Positioned(
                top: 5,
                left: 5,
                child: Image.asset(
                  AppImageAsset.saleOne,
                  width: 40,
                ),
              )
            : Container(),
      ],
    );
  }
}
