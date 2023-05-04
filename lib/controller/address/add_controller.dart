import 'dart:async';

import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAdressController extends GetxController {
  Set<Marker> markers = {};
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    // print("==========================================");

    // print(lat);
    // print(long);
    // print("==========================================");

    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails, arguments: {
      'lat': lat,
      'long': long,
    });
  }

  StatusRequest statusRequest = StatusRequest.loading;
  late Position position;
  double? lat;
  double? long;
  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();

    // print("==========================================");
    // print(lat);
    // print(long);
    // print("==========================================");

    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();
  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
