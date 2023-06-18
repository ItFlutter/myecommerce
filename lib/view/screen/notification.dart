import 'package:ecommerce/controller/notification_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      Center(
                        child: Text(
                          "134".tr,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Stack(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "${controller.data[index]['notification_title']}"),
                                      subtitle: Text(controller.data[index]
                                          ['notification_body']),
                                      trailing: Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          Jiffy(
                                                  controller.data[index]
                                                      ['notification_datetime'],
                                                  "yyy-MM-dd")
                                              .fromNow(),
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //     right: 20,
                                    //     child: Text(
                                    //       Jiffy(
                                    //               controller.data[index]
                                    //                   ['notification_datetime'],
                                    //               "yyy-MM-dd")
                                    //           .fromNow(),
                                    //       style: const TextStyle(
                                    //           color: AppColor.primaryColor,
                                    //           fontWeight: FontWeight.bold),
                                    //     ))
                                  ],
                                ),
                              ))
                    ],
                  ),
                )));
  }
}
