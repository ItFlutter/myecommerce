import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  CartData cartData = CartData(Get.find());
  int discount = 0;
  String? couponname;
  String? couponid;
  CouponModel? couponModel;
  TextEditingController? controllercoupon;
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
          // title: "47".tr,
          messageText: Text(
            "76".tr,
            style: const TextStyle(color: Colors.white),
          ),
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 1),
        );
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
          // title: "47".tr,
          messageText: Text(
            "77".tr,
            style: const TextStyle(color: Colors.white),
          ),
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 1),
        );
      }
    }

    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        // statusRequest = StatusRequest.failure;
        Get.snackbar("47".tr, "124".tr);
        discount = 0;
        couponname = null;
        couponid = null;
      } else {
        couponModel = CouponModel.fromJson(response['data']);
        discount = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      }
    }

    update();
  }

  getTotalPrice() {
    return priceorders - priceorders * discount / 100;
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
    print("=====================================Controller $response");
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
  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("47".tr, "125".tr);
    }
    Get.toNamed(AppRoute.checkout, arguments: {
      'couponid': couponid ?? "0",
      'priceorder': priceorders.toString(),
      'discount': discount.toString()
    });
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
