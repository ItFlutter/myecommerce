import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String categoriesId, String userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": categoriesId, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
