import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerce/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerce/view/widget/productdetails/toppageproductdetails.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 40,
        child: MaterialButton(
          color: AppColor.secondryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Text(
            "135".tr,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(children: [
                const TopProductPageDetails(),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemsModel.itemsName}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColor.fourthColor, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PriceAndCountItems(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          count: "${controller.countitems}",
                          price: "${controller.itemsModel.itemsPriceDiscount}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Color",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColor.fourthColor, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SubItemsList(),
                    ],
                  ),
                )
              ]))),
    );
  }
}
