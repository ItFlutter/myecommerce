import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  CartData cartData = CartData(Get.find());

  int totalcountitems = 0;
  double priceorders = 0.0;
  List<CartModel> data = [];

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "47".tr,
            messageText: Text(
              "76".tr,
              style: const TextStyle(color: Colors.white),
            ));
      }
    }

    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(
            title: "47".tr,
            messageText: Text(
              "77".tr,
              style: const TextStyle(color: Colors.white),
            ));
      }
    }

    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        if (response['datacart']['status'] == "success") {
          List dataresponse = response['datacart']['data'];
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          Map dataresponsecountprice = response['countprice'];
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
        }
      }
    }
    update();
  }
// resetVarCart(){

// }
  @override
  void onInit() {
    view();
    super.onInit();
  }
}
