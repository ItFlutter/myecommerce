import 'dart:async';

import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerce/data/model/ordersdetailsmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<OrdersDetailsModel> data = [];
  late StatusRequest statusRequest;
  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();
  CameraPosition? cameraPosition;
  Set<Marker> markers = {};
  initialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      // markers.clear();
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat ?? "0"),
              double.parse(ordersModel.addressLong ?? "0"))));
    }
  }

  late OrdersModel ordersModel;
  @override
  void onInit() {
    ordersModel = Get.arguments['ordresmodel'];
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersDetailsModel.fromJson(e)));
      }
    }
    update();
  }
}
