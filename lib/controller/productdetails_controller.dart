import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/datasource/remote/productdetails_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
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
            title: "47".tr,
            messageText: Text(
              "added To Cart",
              style: const TextStyle(color: Colors.white),
            ));
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
              "Removed From Cart",
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
  }
}
