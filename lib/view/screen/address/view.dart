import 'package:ecommerce/controller/address/view_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("72".tr),
      ),
      body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return CardAddress(
                            addressmodel: controller.data[index],
                            onDelete: () {
                              controller.deleteAddress(
                                  controller.data[index].addressId!);
                            },
                          );
                        })),
              )),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressmodel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressmodel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
        title: Text("${addressmodel.addressName}"),
        subtitle:
            Text("${addressmodel.addressCity} ${addressmodel.addressStreet}"),
      ),
    );
  }
}
