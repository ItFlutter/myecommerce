import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text("106".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrderListArchive(
                        listdata: controller.data[index]))),
          )),
    );
  }
}
