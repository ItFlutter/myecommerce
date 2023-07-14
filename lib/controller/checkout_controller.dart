import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import "package:get/get.dart";

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  // AddressData addressData = AddressData(Get.find());
  List<AddressModel> dataaddress = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";
  late String couponid;
  late String priceorder;
  late String discount;
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("================Controller===================== $response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("118".tr, "119".tr);
      // return Get.rawSnackbar(title: "118".tr, message: "119".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("118".tr, "120".tr);
    }
    if (deliveryType == "0" && addressid == "0") {
      return Get.snackbar("118".tr, "121".tr);
    }
    // if (dataaddress.isEmpty) {
    //   return Get.snackbar("118".tr, "121".tr);

    // }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'usersid': myServices.sharedPreferences.getString("id"),
      'addressid': addressid,
      'orderstype': deliveryType,
      'pricedelivery': "10",
      'ordersprice': priceorder,
      'discount': discount,
      'couponid': couponid,
      'paymentmethod': paymentMethod,
    };
    var response = await checkoutData.checkout(data);
    print("================Controller===================== $response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("38".tr, "122".tr);
        await Get.offAllNamed(AppRoute.homepage);
      } else {
        // statusRequest = StatusRequest.failure;
        Get.snackbar("118".tr, "123".tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    getShippingAddress();
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discount = Get.arguments['discount'];
    super.onInit();
  }
}
