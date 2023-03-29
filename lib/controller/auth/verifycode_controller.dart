import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }

  @override
  checkcode() {}
  @override
  void onInit() {
    super.onInit();
  }
}
