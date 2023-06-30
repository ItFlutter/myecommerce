import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:ecommerce/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce/view/widget/cart/topcardcart.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "92".tr,
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavigationBarCart(
              controllercoupon: controller.controllercoupon!,
              onApply: () {
                controller.checkCoupon();
              },
              price: "${controller.priceorders} \$",
              discount: "${controller.discount}%",
              shipping: "0",
              totalprice: "${controller.getTotalPrice()} \$"),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                TopCardCart(
                  message: "93".tr +
                      " " +
                      "${controller.totalcountitems}" +
                      " " +
                      "94".tr,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                          onAdd: () async {
                            await controller
                                .add(controller.data[index].itemsId!);
                            controller.refreshPage();
                          },
                          onRemove: () async {
                            await controller
                                .delete(controller.data[index].itemsId!);
                            controller.refreshPage();
                          },
                          imagename: "${controller.data[index].itemsImage}",
                          name: "${controller.data[index].itemsName}",
                          price: "${controller.data[index].itemsPrice}",
                          itemsPriceDiscount:
                              "${controller.data[index].itemspricediscount}",
                          count: "${controller.data[index].countitems}",
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
