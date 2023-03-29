import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  showpassword() {
    // isshowpassword == true ? false : true;
    if (isshowpassword == true) {
      isshowpassword = false;
    } else if (isshowpassword == false) {
      isshowpassword = true;
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
