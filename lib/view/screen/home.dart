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
                  titleappbar: "Find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {}),
              const CustomCardHome(
                title: "A summer surprise",
                body: "Cashback 20%",
              ),
              const CustomTitleHome(
                title: "Categories",
              ),
              const ListCategoriesHome(),
              const CustomTitleHome(
                title: "Product for you",
              ),
              const ListItemsHome(),
              const CustomTitleHome(
                title: "offer",
              ),
              const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
