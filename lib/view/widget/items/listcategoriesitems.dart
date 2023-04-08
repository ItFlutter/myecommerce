import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              Categoriesmodel.fromJson(controller.categories[index]),
              i: index,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int i;
  const Categories(this.categoriesmodel, {Key? key, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColor.primaryColor, width: 3)))
                  : null,
              child: Text(
                "${categoriesmodel.categoriesName}",
                style: const TextStyle(fontSize: 20, color: AppColor.grey2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
