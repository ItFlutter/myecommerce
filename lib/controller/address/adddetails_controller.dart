import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAdressDetailsController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  double? lat;
  double? long;
  StatusRequest statusRequest = StatusRequest.none;
  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addAddress() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
          myServices.sharedPreferences.getString("id")!,
          name.text,
          city.text,
          street.text,
          lat.toString(),
          long.toString());
      print("=====================================Controller ${response}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          statusRequest = StatusRequest.failure;
        } else {
          Get.offAllNamed(AppRoute.homepage);
          Get.snackbar("139".tr, "140".tr);
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    print("===============================================");
    print(lat);
    print(long);
    print("===============================================");

    super.onInit();
  }
}
