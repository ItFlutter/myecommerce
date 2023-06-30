import 'package:ecommerce/controller/myfavoritecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<MyFavoriteControllerImp>(
            builder: ((controller) => ListView(
                  children: [
                    // CustomAppBar(
                    //     onPressedIconFavotite: () {
                    //       Get.toNamed(AppRoute.myFavorite);
                    //     },
                    //     titleappbar: "56".tr,
                    //     // onPressedIcon: () {},
                    //     onPressedSearch: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                        itemCount: controller.dataFavorite.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomListFavoriteItems(
                            favoriteModel: controller.dataFavorite[index],
                            itemsModel: controller.dataItems[index],
                          );
                        },
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
