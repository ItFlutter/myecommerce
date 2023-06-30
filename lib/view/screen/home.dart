import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customCardhome.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/customcardnewestitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15, left: 15, top: 10),
            child: CustomAppBar(
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
          ),
          HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (controller.settingsData.isNotEmpty)
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: CustomCardHome(
                              title: controller.titleHomeCard,
                              body: controller.bodyHomeCard),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: CustomTitleHome(
                            title: "59".tr,
                          ),
                        ),
                        const ListCategoriesHome(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: CustomTitleHome(
                            title: "146".tr,
                          ),
                        ),
                        Container(
                          height: 240,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                controllerFav.isFavorite[
                                        '${controller.items[index]['items_id']}'] =
                                    controller.items[index]['favorite'];
                                return CustomCardtheNewestItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.items[index]),
                                );
                              })),
                        ),

                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: CustomTitleHome(
                            title: "133".tr,
                          ),
                        ),
                        Container(
                          height: 240,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.itemstopselling.length,
                              itemBuilder: ((context, index) {
                                controllerFav.isFavorite[
                                        '${controller.itemstopselling[index]['items_id']}'] =
                                    controller.itemstopselling[index]
                                        ['favorite'];
                                return CustomCardtheNewestItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.itemstopselling[index]),
                                );
                              })),
                        ),
                        // const ListItemsHome(),
                        // CustomTitleHome(
                        //   title: "61".tr,
                        // ),
                        // const ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(
                      listdatamodel: controller.listdata,
                    ))
        ],
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageitems}/${listdatamodel[index].itemsImage}",
                              )),
                          Expanded(
                              flex: 3,
                              child: ListTile(
                                title: Text(
                                  "${listdatamodel[index].itemsName}",
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 15),
                                ),
                                subtitle: Text(
                                    "${listdatamodel[index].categoriesName}"),
                                trailing: Container(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text(
                                    "${listdatamodel[index].itemsPriceDiscount}\$",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                if (listdatamodel[index].itemsDiscount != "0")
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Image.asset(
                      AppImageAsset.saleOne,
                      width: 40,
                    ),
                  )
              ],
            ),
          );
        });
  }
}
