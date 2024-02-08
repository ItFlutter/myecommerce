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
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.ordersdetails,
            arguments: {'ordresmodel': listdata});
      },
      child: Card(
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
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // Spacer(),
                    Text(
                      Jiffy(listdata.ordersDatetime).fromNow(),
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
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
                      "${"100".tr}:${listdata.ordersTotalprice}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     Get.toNamed(AppRoute.ordersdetails,
                    //         arguments: {'ordresmodel': listdata});
                    //   },
                    //   textColor: AppColor.grey2.withOpacity(0.7),
                    //   color: AppColor.thridColor,
                    //   child: Text("114".tr),
                    // ),
                    if (listdata.ordersStatus == "0")
                      MaterialButton(
                        onPressed: () {
                          controller.deleteOrder(listdata.ordersId!);
                        },
                        textColor: AppColor.secondryColor,
                        color: AppColor.thridColor,
                        child: Text("126".tr),
                      ),
                    if (listdata.ordersStatus == "3")
                      MaterialButton(
                        onPressed: () {
                          controller.goToPageTracking(listdata);
                        },
                        textColor: AppColor.secondryColor,
                        color: AppColor.thridColor,
                        child: Text("155".tr),
                      ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
