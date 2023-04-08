import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.items[index]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.network(
            "${AppLink.imageitems}/${itemsModel.itemsImage}",
            height: 180,
            width: 180,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 220,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.black.withOpacity(0.3),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            "${itemsModel.itemsName}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
