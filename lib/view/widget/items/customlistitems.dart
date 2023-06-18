import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  // final bool active;
  final ItemsModel itemsModel;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: itemsModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                      width: 150,
                      height: 130,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold)),
                  Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: AppColor.grey,
                          size: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 3,
                          ),
                          child: Text(
                            "${controller.deliveryTime} ${"136".tr}",
                            style: const TextStyle(fontFamily: "sans"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor, fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setFavorite(
                                    itemsModel.itemsId!, "0");

                                controller.removeFavorite(itemsModel.itemsId!);
                              } else {
                                controller.setFavorite(
                                    itemsModel.itemsId!, "1");
                                controller.addFavorite(itemsModel.itemsId!);
                              }
                              // controller.setFavorite(
                              //     itemsModel.itemsId!,
                              //     controller.isFavorite[itemsModel.itemsId] == "1"
                              //         ? "0"
                              //         : "1");
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == "1"
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
