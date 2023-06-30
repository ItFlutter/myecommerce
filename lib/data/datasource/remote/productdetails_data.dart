import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class ProductDetailsData {
  Crud crud;
  ProductDetailsData(this.crud);
  getData(String itemsid) async {
    var response =
        await crud.postData(AppLink.itemsimages, {"itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
