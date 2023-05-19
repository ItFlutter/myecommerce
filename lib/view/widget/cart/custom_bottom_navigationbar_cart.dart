import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/cart/buttoncart.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final void Function()? onApply;
  final TextEditingController controllercoupon;
  const BottomNavigationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.totalprice,
      this.onApply,
      required this.controllercoupon,
      required this.shipping})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisSize: MainAxisSize.min,
      shrinkWrap: true,
      children: [
        GetBuilder<CartController>(
            builder: ((controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: controllercoupon,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  hintText: "95".tr,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 10)),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                              text: "96".tr, onPressed: onApply),
                        )
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      "95".tr + " " + "${controller.couponname}",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ))),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "97".tr,
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "98".tr,
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    discount,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "99".tr,
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    shipping,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "100".tr,
                    style: const TextStyle(
                        fontSize: 17,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    totalprice,
                    style: const TextStyle(
                        fontSize: 17,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomButtonCart(
          text: "101".tr,
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    );
  }
}
