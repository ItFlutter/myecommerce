import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  logout() {}
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  String? userid;
  late bool value;
  onChanged(bool val) {
    userid = myServices.sharedPreferences.getString("id")!;
    value = val;
    if (val == true) {
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$userid");
      print(val);
      myServices.sharedPreferences.setBool("val", value);
      print(
          "============================ Topic ====================================");
      print("subscribe To Topic users and users$userid");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
      myServices.sharedPreferences.setBool("val", value);
      print(val);

      print(
          "============================ Topic ====================================");
      print("Unsubscribe To Topic users and users$userid");
    }
    update();
  }

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

  @override
  void onInit() {
    value = myServices.sharedPreferences.getBool("val") ?? true;

    super.onInit();
  }
}
