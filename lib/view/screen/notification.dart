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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "134".tr,
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        body: Container(
            // padding: const EdgeInsets.all(10),
            child: GetBuilder<NotificationController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: Center(
                          //     child: Text(
                          //       "134".tr,
                          //       style: const TextStyle(
                          //           color: AppColor.primaryColor,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 18),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          ...List.generate(
                              controller.data.length,
                              (index) => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.goToOrdersPending();
                                        },
                                        child: Container(
                                          // padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.all(10),
                                          child: Stack(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                    "${controller.data[index]['notification_title']}"),
                                                subtitle: Text(
                                                    controller.data[index]
                                                        ['notification_body']),
                                                trailing: Container(
                                                  // width: 120,
                                                  // height: 120,
                                                  // padding:
                                                  //     const EdgeInsets.only(
                                                  //         top: 5),
                                                  child: Text(
                                                    Jiffy(
                                                      controller.data[index][
                                                          'notification_datetime'],
                                                      // "yyy-MM-dd"
                                                    ).fromNow(),
                                                    style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                        ),
                                      ),
                                      Divider(
                                        height: 2,
                                        thickness: 4,
                                      ),
                                    ],
                                  ))
                        ],
                      ),
                    ))));
  }
}
