import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoriesId);
}

class HomeControllerImp extends HomeController {
  String? lang;
  List categories = [];
  List items = [];
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  String? username;
  String? id;
  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['categories'][0]['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      }
    }
    update();
  }

  @override
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
    super.onInit();
  }
}
