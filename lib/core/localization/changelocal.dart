import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/fcmconfig.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../sevices/sevices.dart';

class LocaleController extends GetxController {
  ThemeData appTheme = themeEnglish;
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("47".tr, "81".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("47".tr, "82".tr);
        // return Future.error('Location services are disabled.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // permission = await Geolocator.requestPermission();
      return Get.snackbar("47".tr, "83".tr);
    }
  }

  @override
  void onInit() {
    // requestPermissin();
    // fcmconfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Get.deviceLocale!;
    }
    super.onInit();
  }
}
