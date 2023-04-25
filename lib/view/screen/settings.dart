import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingss extends StatelessWidget {
  const Settingss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAsset.avatar),
                  radius: 40,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("71".tr),
                  trailing: Switch(
                    onChanged: (val) {},
                    value: true,
                  ),
                ),
                ListTile(
                  title: Text("72".tr),
                  onTap: () {},
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  title: Text("73".tr),
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                ListTile(
                  title: Text("75".tr),
                  onTap: () {},
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  title: Text("74".tr),
                  onTap: () {
                    controller.logout();
                  },
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
