import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customCardhome.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listitems.home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            CustomAppBar(
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                mycontroller: controller.search,
                onPressedIconFavotite: () {
                  Get.toNamed(AppRoute.myFavorite);
                },
                titleappbar: "56".tr,
                // onPressedIcon: () {},
                onPressedSearch: () {
                  if (controller.search!.text.isEmpty) {
                  } else {
                    controller.onSearchItems();
                  }
                }),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // if (controller.settingsData.isNotEmpty)
                          CustomCardHome(
                              title: controller.titleHomeCard,
                              body: controller.bodyHomeCard),
                          CustomTitleHome(
                            title: "59".tr,
                          ),
                          const ListCategoriesHome(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTitleHome(
                            title: "133".tr,
                          ),
                          const ListItemsHome(),
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
            child: Container(
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
                          flex: 2,
                          child: ListTile(
                            title: Text("${listdatamodel[index].itemsName}"),
                            subtitle:
                                Text("${listdatamodel[index].categoriesName}"),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
