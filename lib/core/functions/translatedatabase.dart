import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
