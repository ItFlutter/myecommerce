import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  matchPassword();
  goToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  goToSuccessPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.offNamed(AppRoute.successResetPassword);
    } else {
      print("Not Valid");
    }
  }

  @override
  matchPassword() {}
  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
