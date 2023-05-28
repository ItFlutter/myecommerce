import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  MyServices myservices = Get.find();
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  late StatusRequest statusRequest;

  List<OrdersModel> data = [];
  String printOrderType(String val) {
    if (val == "0") {
      return "89".tr;
    } else {
      return "90".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "86".tr;
    } else {
      return "87".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "115".tr;
    } else if (val == "1") {
      return "116".tr;
    } else if (val == "2") {
      return "127".tr;
    } else if (val == "3") {
      return "117".tr;
    } else {
      return "107".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(myservices.sharedPreferences.getString("id")!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    }
    update();
  }

  refreshorder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
