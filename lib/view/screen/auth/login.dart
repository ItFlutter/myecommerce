import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "11".tr,
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
        child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: ListView(children: [
                        const LogoAuth(),
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
                            return validInput(val!, 5, 100, "email");
                          },
                          labeltext: "14".tr,
                          hinttext: "15".tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email,
                        ),
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon: () {
                              controller.showpassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            labeltext: "16".tr,
                            hinttext: "17".tr,
                            iconData: Icons.lock_outlined,
                            mycontroller: controller.password,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.forgetPassword);
                          },
                          child: Text(
                            "18".tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColor.secondColor),
                          ),
                        ),
                        CustomButtonAuth(
                            text: "11".tr,
                            onPressed: () {
                              controller.login();
                            }),
                        CustomTextSignUpOrSignIn(
                          textone: "19".tr,
                          texttwo: "20".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                      ]),
                    ),
                  ),
                )),
      ),
    );
  }
}
