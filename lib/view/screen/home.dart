import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
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
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                  titleappbar: "56".tr,
                  onPressedIcon: () {},
                  onPressedSearch: () {}),
              CustomCardHome(
                title: "57".tr,
                body: "58".tr,
              ),
              CustomTitleHome(
                title: "59".tr,
              ),
              const ListCategoriesHome(),
              CustomTitleHome(
                title: "60".tr,
              ),
              const ListItemsHome(),
              CustomTitleHome(
                title: "61".tr,
              ),
              const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
