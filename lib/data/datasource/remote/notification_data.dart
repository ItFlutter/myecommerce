import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.notification, {'id': userid});
    return response.fold((l) => l, (r) => r);
  }
}
