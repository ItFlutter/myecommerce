import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  goToVerifyCode() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.toNamed(AppRoute.verifyCode);
    } else {
      print("Not Valid");
    }
  }

  @override
  checkemail() {}
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
