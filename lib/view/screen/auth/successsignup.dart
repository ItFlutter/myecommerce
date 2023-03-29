import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custombutton.dart';

class SucessSignUp extends StatelessWidget {
  const SucessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "38".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: AppColor.primaryColor,
                size: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "41".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "40".tr,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Container(
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
