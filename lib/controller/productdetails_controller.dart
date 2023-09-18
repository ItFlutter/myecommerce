import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/datasource/remote/productdetails_data.dart';
import 'package:ecommerce/data/datasource/remote/rating/rating_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  RatingData ratingData = RatingData(Get.find());
  double rate = 0;
  RxInt rateUser = 0.obs;
  int currentImage = 0;
  // CartController cartContoller = Get.put(CartController());
  CartData cartData = CartData(Get.find());
  ProductDetailsData productDetailsData = ProductDetailsData(Get.find());
  MyServices myServices = Get.find();
  List images = [];
  late ItemsModel itemsModel;
  List subItems = [
    {
      "id": "1",
      "name": "Red",
      "active": "1",
    },
    {
      "id": "2",
      "name": "Black",
      "active": "0",
    },
    {
      "id": "3",
      "name": "Blue",
      "active": "0",
    }
  ];

  onImageChanged(int index) {
    currentImage = index;
    update();
  }

  addItems(String itemsid) async {
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

  getItemsImages() async {
    statusRequest = StatusRequest.loading;
    var response = await productDetailsData.getData(itemsModel.itemsId!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        images.addAll(response['data']);
        print("==============================================");
        print("======================$images========================");
      }
    }

    update();
  }

  deleteItems(String itemsid) async {
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

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("============================================");
        print("$countitems");
        return countitems;
      }
    }
  }

  getRating() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.getData({"id": itemsModel.itemsId});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data'] != "0") {
          rate = double.parse(response['data']);
        } else {
          rate = 0;
        }
      }
    }
    update();
  }

  getUserRate() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.getDataUserRate({
      "itemid": itemsModel.itemsId,
      "userid": myServices.sharedPreferences.getString("id")
    });
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        rateUser.value = int.parse(response['data']);
      } else {
        rateUser.value = 0;
      }
    }
    update();
  }

  ratedialog(int index) {
    rateUser.value = (index + 1);
    updateUserRate();
    Get.back();
    //update rate
  }

  updateUserRate() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.updateDataUserRate({
      "itemid": itemsModel.itemsId,
      "userid": myServices.sharedPreferences.getString("id"),
      "rateuser": rateUser.value.toString()
    });
    statusRequest = handlingData(response);
    print("=======================================$statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        getRating();
      } else {
        Get.defaultDialog(title: "47".tr, content: Text("154".tr));
      }
    }
    update();
  }

  int countitems = 0;
  StatusRequest? statusRequest;
  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    getItemsImages();
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteItems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    getRating();
  }
}
