import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("======================================");
    print(Get.currentRoute);
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("106".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        CardOrderList(listdata: controller.data[index]))),
          )),
    );
  }
}
