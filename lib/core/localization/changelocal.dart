import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
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

  @override
  void onInit() {
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
