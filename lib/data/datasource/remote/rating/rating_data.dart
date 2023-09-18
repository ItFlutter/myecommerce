import 'package:ecommerce/linkapi.dart';

import '../../../../core/class/crud.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);
  getData(Map data) async {
    var response = await crud.postData(AppLink.ratingproduct, data);
    return response.fold((l) => l, (r) => r);
  }

  getDataUserRate(Map data) async {
    var response = await crud.postData(AppLink.ratinguser, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDataUserRate(Map data) async {
    var response = await crud.postData(AppLink.udaterateuser, data);
    return response.fold((l) => l, (r) => r);
  }
}
