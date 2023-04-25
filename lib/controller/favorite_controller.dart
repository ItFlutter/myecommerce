import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(String id, String val);
}

class FavoriteControllerImp extends FavoriteController {
  // List data = [];
  StatusRequest? statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  Map isFavorite = {};
  @override
  setFavorite(String id, String val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "47".tr,
            messageText: Text(
              "67".tr,
              style: const TextStyle(color: Colors.white),
            ));
      }
    }
  }

  removeFavorite(String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "47".tr,
            messageText: Text(
              "68".tr,
              style: const TextStyle(color: Colors.white),
            ));
      }
    }
  }
}
