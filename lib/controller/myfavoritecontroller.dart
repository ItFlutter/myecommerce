import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/myfavorite.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {}

class MyFavoriteControllerImp extends MyFavoriteController {
  List<MyFavoriteModel> dataFavorite = [];
  List<ItemsModel> dataItems = [];
  StatusRequest? statusRequest;
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        // data.addAll(response['data']);
        List responsedata = response['data'];
        dataFavorite
            .addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        dataItems.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        print("data");
        print(dataFavorite);
      }
    }
    update();
  }

  deleteFromFavorite(String id) {
    var response = favoriteData.deletedata(id);
    dataFavorite.removeWhere(
      (element) => element.favoriteId == id,
    );

    update();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsModel": itemsModel,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    print(
        "=============================dispose==================================");
    super.dispose();
  }
}
