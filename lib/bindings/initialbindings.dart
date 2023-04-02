import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

// import 'controller/auth/signup_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
  }
}
