import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/cart/appbarcart.dart';
import 'package:ecommerce/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:ecommerce/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce/view/widget/cart/topcardcart.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavigationBarCart(
              price: "${controller.priceorders} \$",
              shipping: "300 \$",
              totalprice: "1500 \$"),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                const TopAppbarCart(
                  title: "My Cart",
                ),
                const SizedBox(
                  height: 10,
                ),
                TopCardCart(
                  message:
                      "you Have ${controller.totalcountitems} Items in Your List",
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
                          price: "${controller.data[index].itemsprice} \$",
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
