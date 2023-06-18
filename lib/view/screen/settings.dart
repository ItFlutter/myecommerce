import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/class/clippath.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: Get.width / 3,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColor.primaryColor, AppColor.thridColor])),
                // color: AppColor.primaryColor,
              ),
            ),
            Positioned(
              top: Get.width / 4.7,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAsset.avatar),
                  radius: 50,
                ),
              ),
            ),
            // Positioned(
            //     top: Get.width / 8.5,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           controller.username!,
            //           style: TextStyle(
            //               fontSize: 18,
            //               color: Colors.grey[200],
            //               fontWeight: FontWeight.w600),
            //         ),
            //         // Text(
            //         //   controller.email!,
            //         //   style: TextStyle(
            //         //       fontSize: 12,
            //         //       color: AppColor.grey,
            //         //       fontWeight: FontWeight.bold),
            //         // ),
            //       ],
            //     ))
          ],
        ),
        const SizedBox(height: 65),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<SettingsControllerImp>(
            builder: (controller) => Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("134".tr),
                    trailing: Switch(
                      activeColor: AppColor.primaryColor,
                      onChanged: (val) {
                        controller.onChanged(val);
                      },
                      value: controller.value,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "141".tr,
                    ),
                    trailing: DropdownButton(
                      onChanged: (String? val) {
                        controller.changeLang(val!);
                      },
                      items: [
                        DropdownMenuItem(
                          value: "3".tr,
                          child: Text("3".tr),
                        ),
                        DropdownMenuItem(
                          value: "2".tr,
                          child: Text("2".tr),
                        ),
                      ],
                      value: controller.selectedLanguage,
                    ),
                  ),
                  ListTile(
                    title: Text("106".tr),
                    onTap: () {
                      Get.toNamed(AppRoute.orderspending);
                    },
                    trailing: const Icon(Icons.shopping_cart),
                  ),
                  ListTile(
                    title: Text("107".tr),
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    trailing: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    title: Text("72".tr),
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    title: Text("73".tr),
                    onTap: () {},
                    trailing: const Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    title: Text("75".tr),
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+963-930-408-122"));
                    },
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
          ),
        )
      ],
    );
  }
}
