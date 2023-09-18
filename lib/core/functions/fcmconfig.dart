import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("====================== Notifications ==========================");
    print(message.notification!.title);
    print(message.notification!.body);
    if (message.data['pagename'] == "itemrefresh") {
      refreshPageNotification(message.data);
    } else {
      FlutterRingtonePlayer.playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refreshPageNotification(message.data);
    }
  });
}

refreshPageNotification(data) {
  print("=================================Page Name");
  print(data['pagename']);
  print("=================================Page Id");
  print(data['pageid']);
  print("====================================Current Route");
  print(Get.currentRoute);
  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    print("==============================I Am In Page Order");
    OrdersPendingController controller = Get.find();
    controller.refreshorder();
  }
  if (Get.currentRoute == "/items" && data['pagename'] == "itemrefresh") {
    print("==============================I Am In Page Item");
    ItemsControllerImp controllerItems = Get.find();
    controllerItems.getItems(controllerItems.categoriesId);
  }
}

requestPermissin() async {
  print(
      "====================== Notifications Permissin==========================");

  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
