import 'package:ecommerce/core/constant/routes.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Addrees"),
      ),
      body: Container(
          child: ListView(
        children: [],
      )),
    );
  }
}
