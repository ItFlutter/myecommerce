import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  changeCat(int val);
  initialData();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
  }

  @override
  changeCat(int val) {
    selectedCat = val;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
