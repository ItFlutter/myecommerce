import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
showDialogRating(BuildContext context, String ordersid) {
  OrdersArchiveController controller = Get.find();
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              '129'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              '130'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.logo,
              height: 100,
              width: 100,
            ),
            submitButtonText: '131'.tr,
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            commentHint: '132'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              controller.submitRating(
                  ordersid, response.rating, response.comment);
            },
          ));
}
