import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifycodesignup_controller.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "30".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: ListView(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextTitleAuth(
                        text: "31".tr,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextBodyAuth(
                        text: "${"32".tr}${controller.email}",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        numberOfFields: 5,
                        fieldWidth: 50,
                        borderRadius: BorderRadius.circular(20),
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.verifycode = verificationCode;
                          controller.goToSuccessSignUp();
                        }, // end onSubmit
                      ),
                    ]),
                  ),
                )));
  }
}
