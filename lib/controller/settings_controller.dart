import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  logout() {}
}

class SettingsControllerImp extends SettingsController {
  late String selectedLanguage;
  LocaleController controllerlang = Get.find();

  MyServices myServices = Get.find();
  String? userid;
  String? username;
  String? email;
  late bool value;
  onChanged(bool val) {
    userid = myServices.sharedPreferences.getString("id")!;
    value = val;
    if (val == true) {
      // FirebaseMessaging.instance.subscribeToTopic("users");
      // FirebaseMessaging.instance.subscribeToTopic("users$userid");
      print(val);
      myServices.sharedPreferences.setBool("val", value);
      print(
          "============================ Topic ====================================");
      print("subscribe To Topic users and users$userid");
    } else {
      // FirebaseMessaging.instance.unsubscribeFromTopic("users");
      // FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
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
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    print(
        "============================ Topic ====================================");
    print("Unsubscribe To Topic users and users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  changeLang(String value) {
    if (value == "3".tr) {
      controllerlang.changeLang("en");
      selectedLanguage = "3".tr;
    } else {
      controllerlang.changeLang("ar");
      selectedLanguage = "2".tr;
    }
    update();
  }

  @override
  void onInit() {
    selectedLanguage = myServices.sharedPreferences.getString("lang") == "ar"
        ? "2".tr
        : "3".tr;
    value = myServices.sharedPreferences.getBool("val") ?? true;
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    super.onInit();
  }
}
