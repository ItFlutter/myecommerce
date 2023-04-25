import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/myfavorite.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {}

class MyFavoriteControllerImp extends MyFavoriteController {
  List<MyFavoriteModel> data = [];
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
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      }
    }
    update();
  }

  deleteFromFavorite(String id) {
    var response = favoriteData.deletedata(id);
    data.removeWhere(
      (element) => element.favoriteId == id,
    );

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
