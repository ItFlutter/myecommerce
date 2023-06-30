import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/sevices/sevices.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  // signWithGoogle();
}

class LoginControllerImp extends LoginController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());
  showpassword() {
    // isshowpassword == true ? false : true;
    if (isshowpassword == true) {
      isshowpassword = false;
    } else if (isshowpassword == false) {
      isshowpassword = true;
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=====================================Controller ${response}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "47".tr, middleText: "51".tr);
        } else {
          // data.addAll(response['status']);
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", "${response['data']['users_id']}");
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", "${response['data']['users_name']}");
            myServices.sharedPreferences
                .setString("email", "${response['data']['users_email']}");
            myServices.sharedPreferences
                .setString("phone", "${response['data']['users_phone']}");
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            print(
                "============================ Topic ====================================");
            print("Subscribe To Topic users and users$userid");
            Get.offNamed(
              AppRoute.homepage,
            );
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp,
                arguments: {'email': email.text});
          }
        }
      }
      update();
      // Get.delete<SignUpControllerImp>();
    } else {
      print("Not Valid");
    }
  }

//   @override
//   signWithGoogle() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     try {
// // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       print(
//           "============================ userCredential ======================================");
//       print(userCredential.user!.uid);
//       myServices.sharedPreferences
//           .setString("id", "${userCredential.user!.uid}");
//       String userid = myServices.sharedPreferences.getString("id")!;
//       myServices.sharedPreferences.setString("step", "2");
//       FirebaseMessaging.instance.subscribeToTopic("users");
//       FirebaseMessaging.instance.subscribeToTopic("users$userid");
//       statusRequest == StatusRequest.success;

//       Get.offNamed(
//         AppRoute.homepage,
//       );
//     } catch (_) {
//       Get.defaultDialog(title: "47".tr, middleText: "144".tr);
//       statusRequest = StatusRequest.failure;
//     }

//     update();
//     // Get.delete<SignUpControllerImp>();
//   }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
