import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "33".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: ListView(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextTitleAuth(
                    text: "34".tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextBodyAuth(
                    text: "35".tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    labeltext: "16".tr,
                    hinttext: "17".tr,
                    iconData: Icons.lock_outlined,
                    mycontroller: controller.password,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    labeltext: "16".tr,
                    hinttext: "36".tr,
                    iconData: Icons.lock_outlined,
                    mycontroller: controller.repassword,
                  ),
                  CustomButtonAuth(
                      text: "37".tr,
                      onPressed: () {
                        controller.goToSuccessPassword();
                      }),
                ]),
              ),
            ),
          ),
        ));
  }
}
