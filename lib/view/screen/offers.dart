import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/offers/customitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteControllerImp());
    return GetBuilder<OffersController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CustomListItemsOffer(
                      itemsModel: controller.data[index]);
                })));
  }
}
