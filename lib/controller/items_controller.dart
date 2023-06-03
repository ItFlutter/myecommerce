import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/sevices/sevices.dart';

// abstract class ItemsController extends GetxController {
//   changeCat(int val, String catVal);
//   initialData();
//   getItems(String categoriesId);
//   goToPageProductDetails(ItemsModel itemsModel);
// }

class ItemsControllerImp extends SearchMixController {
  MyServices myservices = Get.find();
  late String categoriesId;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  List categories = [];
  int? selectedCat;
  String deliveryTime = "";
  @override
  void onInit() {
    initialData();
    search = TextEditingController();
    super.onInit();
  }

  initialData() {
    deliveryTime = myservices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    categoriesId = Get.arguments['categoriesId'];
    getItems(categoriesId);
  }

  changeCat(int val, String catVal) {
    selectedCat = val;
    getItems(catVal);
    update();
  }

  getItems(String categoriesId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoriesId, myservices.sharedPreferences.getString("id")!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        data.addAll(response['data']);
      }
    }
    update();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsModel": itemsModel,
    });
  }
}
