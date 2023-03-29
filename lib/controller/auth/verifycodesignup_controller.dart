import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoute.successSignUp);
  }

  @override
  checkcode() {}
  @override
  void onInit() {
    super.onInit();
  }
}
