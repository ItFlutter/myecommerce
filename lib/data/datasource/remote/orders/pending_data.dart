import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingorders, {'id': usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response = await crud.postData(AppLink.ordersdelete, {'id': ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
