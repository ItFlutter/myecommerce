import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../sevices/sevices.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
