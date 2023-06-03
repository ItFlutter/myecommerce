import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            onPressed: () {
              controller.checkout();
            },
            color: AppColor.secondryColor,
            textColor: Colors.white,
            child: Text(
              "84".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("84".tr),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(children: [
                      Text(
                        "85".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondryColor),
                      ),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0");
                          },
                          child: CardPaymentMethodCheckout(
                              title: "86".tr,
                              isActive: controller.paymentMethod == "0"
                                  ? true
                                  : false)),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("1");
                          },
                          child: CardPaymentMethodCheckout(
                              title: "87".tr,
                              isActive: controller.paymentMethod == "1"
                                  ? true
                                  : false)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "88".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondryColor),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");
                            },
                            child: CardDeliveryTypecheckout(
                              title: "89".tr,
                              imageName: AppImageAsset.deliveryImage2,
                              active:
                                  controller.deliveryType == "0" ? true : false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1");
                            },
                            child: CardDeliveryTypecheckout(
                              title: "90".tr,
                              imageName: AppImageAsset.drivethruImage,
                              active:
                                  controller.deliveryType == "1" ? true : false,
                            ),
                          ),
                        ],
                      ),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "91".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.secondryColor),
                              ),
                            ),
                            // if (controller.dataaddress.isEmpty)
                            if (controller.dataaddress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(AppRoute.addressadd);
                                },
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "137".tr,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.primaryColor),
                                      ),
                                      Text(
                                        "138".tr,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId);
                                },
                                child: CardShippingAddressCheckout(
                                  title:
                                      "${controller.dataaddress[index].addressName}",
                                  subtitle:
                                      "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                  isactive: controller.addressid ==
                                          controller
                                              .dataaddress[index].addressId
                                      ? true
                                      : false,
                                ),
                              ),
                            )
                          ],
                        )
                    ]),
                  ),
                )));
  }
}
