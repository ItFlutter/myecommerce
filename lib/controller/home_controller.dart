import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// abstract class HomeController extends GetxController {
//   initialData();
//   getData();
//   goToItems(List categories, int selectedCat, String categoriesId);
// }

class HomeControllerImp extends SearchMixController {
  String? lang;
  List categories = [];
  List items = [];

  MyServices myServices = Get.find();
  String? username;
  String? id;
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['categories']['status'] == "failure" &&
          response['items']['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      }
    }
    update();
  }

  goToItems(List categories, int selectedCat, String categoriesId) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "categoriesId": categoriesId
    });
  }

  @override
  void onInit() {
    getData();

    initialData();
    search = TextEditingController();
    super.onInit();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsModel": itemsModel,
    });
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;

  List<ItemsModel> listdata = [];
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      listdata.clear();
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      }
    }
    update();
  }

  bool isSearch = false;
  onSearchItems() {
    searchData();
    isSearch = true;
    update();
  }

  checkSearch(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }
}
