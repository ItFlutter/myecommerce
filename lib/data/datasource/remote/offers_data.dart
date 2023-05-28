import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.offers, {'userid': userid});
    return response.fold((l) => l, (r) => r);
  }
}
