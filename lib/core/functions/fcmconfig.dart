// import 'package:ecommerce/controller/orders/pending_controller.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:get/get.dart';

// fcmconfig() {
//   FirebaseMessaging.onMessage.listen((message) {
//     print("====================== Notifications ==========================");
//     print(message.notification!.title);
//     print(message.notification!.body);
//     FlutterRingtonePlayer.playNotification();
//     Get.snackbar(message.notification!.title!, message.notification!.body!);
//     refreshPageNotification(message.data);
//   });
// }

// refreshPageNotification(data) {
//   print("=================================Page Name");
//   print(data['pagename']);
//   print("=================================Page Id");
//   print(data['pageid']);
//   print("====================================Current Route");
//   print(Get.currentRoute);
//   if (Get.currentRoute == "/orderspending" &&
//       data['pagename'] == "refreshorderpending") {
//     print("==============================I Am In Page Order");
//     OrdersPendingController controller = Get.find();
//     controller.refreshorder();
//   }
// }

// requestPermissin() async {
//   print(
//       "====================== Notifications Permissin==========================");

//   NotificationSettings settings =
//       await FirebaseMessaging.instance.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
// }
