import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/statuscode.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "20".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: ((controller) => HandlingDataViewRequest(
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
                          text: "12".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextBodyAuth(
                          text: "13".tr,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 20, "username");
                          },
                          labeltext: "22".tr,
                          hinttext: "23".tr,
                          iconData: Icons.person_outline,
                          mycontroller: controller.username,
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
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 9, 13, "phone");
                          },
                          labeltext: "24".tr,
                          hinttext: "25".tr,
                          iconData: Icons.phone_android,
                          mycontroller: controller.phone,
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
                        CustomButtonAuth(
                            text: "20".tr,
                            onPressed: () {
                              controller.signUp();
                            }),
                        CustomTextSignUpOrSignIn(
                          textone: "26".tr,
                          texttwo: "11".tr,
                          onTap: () {
                            controller.goToSignIn();
                          },
                        ),
                      ]),
                    ),
                  ),
                )),
          ),
        ));
  }
}
