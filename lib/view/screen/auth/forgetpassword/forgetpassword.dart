import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombutton.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "18".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: ListView(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitleAuth(
                          text: "27".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextBodyAuth(
                          text: "28".tr,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          labeltext: "14".tr,
                          hinttext: "15".tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email,
                        ),
                        CustomButtonAuth(
                            text: "29".tr,
                            onPressed: () {
                              controller.checkemail();
                            }),
                      ]),
                    ),
                  ),
                )));
  }
}
