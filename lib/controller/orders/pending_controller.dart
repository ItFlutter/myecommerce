import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  MyServices myservices = Get.find();
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  late StatusRequest statusRequest;
  goToPageTracking(OrdersModel ordersModle) {
    Get.toNamed(AppRoute.orderstracking,
        arguments: {"ordresmodel": ordersModle});
  }

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
      return "It has been approved and is being prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery Man";
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
    var response = await ordersPendingData
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

  deleteOrder(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        data.removeWhere(
          (element) {
            return element.ordersId == orderid;
          },
        );
        // refreshorder();
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
