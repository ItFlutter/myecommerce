import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {'usersid': userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {'usersid': userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {'usersid': userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {'couponname': couponname});
    return response.fold((l) => l, (r) => r);
  }
}
