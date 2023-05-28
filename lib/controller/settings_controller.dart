import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  logout() {}
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    print(
        "============================ Topic ====================================");
    print("Unsubscribe To Topic users and users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
