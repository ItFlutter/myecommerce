import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  getData() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
