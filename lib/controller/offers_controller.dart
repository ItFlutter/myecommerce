import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

class OffersController extends SearchMixController {
  MyServices myServices = Get.find();
  OfferData offerData = OfferData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await offerData.getData(myServices.sharedPreferences.getString('id')!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List listdata = response['data'];

        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController();
    super.onInit();
  }
}
