import 'package:ecommerce/core/constant/color.dart';
import "package:flutter/material.dart";

ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(
        // color: AppColor.primaryColor,
        // foregroundColor: AppColor.fourthColor,
        backgroundColor: AppColor.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      // foregroundColor: AppColor.fourthColor
    ),
    fontFamily: "PlayfairDisplay",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headline2: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodyText1: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
      bodyText2: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
    ));
ThemeData themeArabic = ThemeData(
    appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColor.black),
      headline2: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColor.black),
      bodyText1: TextStyle(
          height: 1.7,
          color: AppColor.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15),
      bodyText2: TextStyle(height: 1.7, color: AppColor.grey, fontSize: 15),
    ));
