import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String email;
  late String verifycode;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postdata(email, verifycode);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(title: "47".tr, middleText: "53".tr);
      } else {
        // data.addAll(response['status']);
        Get.offNamed(AppRoute.successSignUp);
      }
    }
    update();
  }

  @override
  checkcode() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
