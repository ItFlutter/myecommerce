import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersarchive, {'id': usersid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {
      'id': ordersid,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
