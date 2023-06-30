import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class CustomListItemsOffer extends GetView<OffersController> {
  // final bool active;
  final ItemsModel itemsModel;
  const CustomListItemsOffer({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: itemsModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                        fontSize: 15,
                        color: AppColor.black,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice}\$",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${itemsModel.itemsPriceDiscount}\$",
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<FavoriteControllerImp>(
                      builder: (controller2) => IconButton(
                          onPressed: () {
                            if (controller2.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller2.setFavorite(itemsModel.itemsId!, "0");

                              controller2.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller2.setFavorite(itemsModel.itemsId!, "1");
                              controller2.addFavorite(itemsModel.itemsId!);
                            }
                            // controller.setFavorite(
                            //     itemsModel.itemsId!,
                            //     controller.isFavorite[itemsModel.itemsId] == "1"
                            //         ? "0"
                            //         : "1");
                          },
                          icon: Icon(
                            controller2.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          if (itemsModel.itemsDiscount != "0")
            Positioned(
              top: 5,
              left: 5,
              child: Image.asset(
                AppImageAsset.saleOne,
                width: 40,
              ),
            )
        ],
      )),
    );
  }
}
