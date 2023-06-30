import 'package:ecommerce/controller/orders/details_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("147".tr)),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Text(
                                "148".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Text(
                                "149".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Text(
                                "97".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itemsName}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].countitems}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].itemsprice}",
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              "Price : ${controller.ordersModel.ordersTotalprice}\$",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: ListTile(
                        title: const Text("Shipping Address"),
                        subtitle: Text(
                            "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}")),
                  ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers,
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller
                              .complete(controllermap);
                        },
                      ),
                    ),
                  )
              ]),
            ),
          )),
    );
  }
}
