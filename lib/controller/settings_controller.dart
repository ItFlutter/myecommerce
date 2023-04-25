import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  logout() {}
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
