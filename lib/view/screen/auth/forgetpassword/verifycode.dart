import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/verifycode_controller.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
            text: "32".tr,
          ),
          const SizedBox(
            height: 30,
          ),
          OtpTextField(
            numberOfFields: 5,
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(20),
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToResetPassword();
            }, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
