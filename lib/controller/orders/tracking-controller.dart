import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statuscode.dart';
import '../../core/sevices/sevices.dart';
import '../../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  // OrdersAcceptedController ordersAcceptedController = Get.find();
  // Timer? timer;
  // MyServices myServices = Get.find();
  // Set<Polyline> polylineSet = {};

  GoogleMapController? gmc;
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  // double? currentlat;
  // double? currentlong;
  double? destlat;
  double? destlong;

  StatusRequest statusRequest = StatusRequest.none;
  Set<Marker> markers = {};

  // StreamSubscription<Position>? positionStream;
  // donedelivery() async {
  // statusRequest = StatusRequest.loading;
  // update();
  // await ordersAcceptedController.doneDelivery(
  //     ordersModel.ordersId!, ordersModel.ordersUsersid!);
  // Get.offAllNamed(AppRoute.homepage);
  // statusRequest = StatusRequest.none;
  // update();
  // }

  initialData() {
    cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746);
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(double.parse(ordersModel.addressLat ?? "0"),
            double.parse(ordersModel.addressLong ?? "0"))));
    // positionStream =
    //     Geolocator.getPositionStream().listen((Position? position) {
    //   currentlat = position!.latitude;
    //   currentlong = position.longitude;
    // refreshLocation();
    // print(
    //     "==========================latitude&longitude=============================${position}");
    // print(
    //     "==========================longitude=============================${position.longitude}");
    // markers.removeWhere((element) => element.markerId == "current");
    //   markers.add(Marker(
    //       markerId: const MarkerId("current"),
    //       position: LatLng(currentlat!, currentlong!)));
    //   if (gmc != null) {
    //     gmc!.animateCamera(
    //         CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
    //   }
    //   update();
    // });
    // print("===================================================afterlisten");
  }

  // initPolyline() async {
  //   polylineSet = await getPolyLine(currentlat, currentlong,
  //       ordersModel.addressId, ordersModel.addressLong);
  // }

  // refreshLocation() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   timer = Timer.periodic(Duration(seconds: 10), (timer) {
  //     FirebaseFirestore.instance
  //         .collection("delivery")
  //         .doc(ordersModel.ordersId)
  //         .set({
  //       "lat": currentlat,
  //       "long": currentlong,
  //       "deliveryid": myServices.sharedPreferences.getString("id"),
  //     });
  //     print(
  //         "=================================================================Firestore");
  //   });
  // }
  getLocationdelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      destlat = event.get("lat");
      destlong = event.get("long");
      updateMarkerDelivery(destlat, destlong);
    });
  }

  updateMarkerDelivery(newlat, newlong) {
    markers.removeWhere((element) => element.markerId == "dest");
    markers.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newlat!, newlong!)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordresmodel'];
    initialData();
    getLocationdelivery();
    // initPolyline();

    // refreshLocation();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // positionStream!.cancel();
    // timer!.cancel();
    gmc!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
