import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrderList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${"108".tr} : #${listdata.ordersId}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Jiffy(listdata.ordersDatetime, "yyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              Text(
                  "${"109".tr} : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("${"110".tr} : ${listdata.ordersPrice} \$"),
              Text("${"111".tr} : ${listdata.ordersPricedelivery} \$"),
              Text(
                  "${"112".tr} : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
              Text(
                  "${"113".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${"100".tr} : ${listdata.ordersTotalprice} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondryColor),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {'ordresmodel': listdata});
                    },
                    textColor: AppColor.secondryColor,
                    color: AppColor.thridColor,
                    child: Text("114".tr),
                  ),
                  if (listdata.ordersStatus == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!);
                      },
                      textColor: AppColor.secondryColor,
                      color: AppColor.thridColor,
                      child: Text("126".tr),
                    ),
                ],
              )
            ],
          )),
    );
  }
}
