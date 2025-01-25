import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/successresetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombutton.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "38".tr,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.check_circle_outline,
              //   color: AppColor.primaryColor,
              //   size: 200,
              // ),
              Image.asset(AppImageAsset.success),

              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  "39".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 25),
                ),
              ),
              // Text(
              //   "40".tr,
              //   style: Theme.of(context).textTheme.bodyText1,
              // ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: CustomButtonAuth(
                      text: "40".tr,
                      onPressed: () {
                        controller.goToLogin();
                      })),
            ],
          )),
    );
  }
}
