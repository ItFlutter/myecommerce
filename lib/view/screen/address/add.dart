import 'package:ecommerce/controller/address/add_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdressController());
    return Scaffold(
        appBar: AppBar(
          title: Text("78".tr),
        ),
        body: GetBuilder<AddAdressController>(
            builder: ((controllerpage) => HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Column(
                  children: [
                    if (controllerpage.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GoogleMap(
                              markers: controllerpage.markers,
                              onTap: (latlong) {
                                controllerpage.addMarkers(latlong);
                              },
                              mapType: MapType.normal,
                              initialCameraPosition:
                                  controllerpage.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controllerpage.completercontroller
                                    .complete(controllermap);
                              },
                            ),
                            MaterialButton(
                              onPressed: () {
                                controllerpage.goToPageAddDetailsAddress();
                              },
                              color: AppColor.primaryColor,
                              textColor: Colors.white,
                              minWidth: 150,
                              child: Text(
                                "79".tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                )))));
  }
}
