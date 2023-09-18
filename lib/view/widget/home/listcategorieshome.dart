import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 10, right: 10),
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

class Categories extends GetView<HomeControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int i;
  const Categories(this.categoriesmodel, {Key? key, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i, categoriesmodel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryColor),
            width: 65,
            height: 60,
            child: SvgPicture.network(
              "${AppLink.imagecategories}/${categoriesmodel.categoriesImage}",
              color: AppColor.backgroundcolor,
            ),
          ),
          Text(
            "${translateDatabase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          )
        ],
      ),
    );
  }
}
