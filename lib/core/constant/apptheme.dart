import 'package:ecommerce/core/constant/color.dart';
import "package:flutter/material.dart";

ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(
      // color: AppColor.primaryColor,
      // foregroundColor: AppColor.fourthColor,
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        // fontFamily: "Muli"
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      // foregroundColor: AppColor.fourthColor
    ),
    fontFamily: "Muli",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headlineSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headlineMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodySmall: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
      bodyMedium: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    ));
ThemeData themeArabic = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        // fontFamily: "Cairo"
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    // fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headlineSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headlineMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodySmall: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
      bodyMedium: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
    ));
