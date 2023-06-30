import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/offers/customitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                      iconData: Icons.notifications_active_outlined,
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                      mycontroller: controller.search,
                      onPressedIconFavotite: () {
                        Get.toNamed(AppRoute.notification);
                      },
                      titleappbar: "56".tr,
                      // onPressedIcon: () {},
                      onPressedSearch: () {
                        if (controller.search!.text.isEmpty) {
                        } else {
                          controller.onSearchItems();
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.isSearch == false
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                controllerFav.isFavorite[
                                        '${controller.data[index].itemsId}'] =
                                    controller.data[index].favorite;
                                return CustomListItemsOffer(
                                    itemsModel: controller.data[index]);
                              }))
                      : ListItemsSearch(
                          listdatamodel: controller.listdata,
                        ),
                ],
              ),
            ));
  }
}
