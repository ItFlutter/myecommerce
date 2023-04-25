import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLink.favoriteAdd, {'userid': userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {'userid': userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
