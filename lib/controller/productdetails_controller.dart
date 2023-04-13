import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  List subItems = [
    {
      "id": "1",
      "name": "Red",
      "active": "1",
    },
    {
      "id": "2",
      "name": "Black",
      "active": "0",
    },
    {
      "id": "3",
      "name": "Blue",
      "active": "0",
    }
  ];

  @override
  initialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    initialData();
  }
}
