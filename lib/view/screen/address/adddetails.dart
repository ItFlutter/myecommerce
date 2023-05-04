import 'package:ecommerce/controller/address/adddetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/shared/custombutton.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("80".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAdressDetailsController>(
            builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      CustomTextFormAuth(
                          hinttext: "city",
                          labeltext: "city",
                          iconData: Icons.location_city,
                          mycontroller: controller.city,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFormAuth(
                          hinttext: "street",
                          labeltext: "street",
                          iconData: Icons.streetview,
                          mycontroller: controller.street,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFormAuth(
                          hinttext: "name",
                          labeltext: "name",
                          iconData: Icons.near_me,
                          mycontroller: controller.name,
                          valid: (val) {},
                          isNumber: false),
                      CustomButton(
                        text: "Add",
                        onPressed: () {
                          controller.addAddress();
                        },
                      )
                    ],
                  ),
                )),
          )),
    );
  }
}
