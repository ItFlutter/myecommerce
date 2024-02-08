import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce/view/screen/auth/successsignup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/orders/details.dart';
import 'package:ecommerce/view/screen/orders/ordertracking.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/address/add.dart';
import 'view/screen/address/adddetails.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/cart.dart';
import 'view/screen/homescreen.dart';
import 'view/screen/notification.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/orders/archive.dart';
import 'view/screen/productdetails.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //Auth
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SucessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  //Address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  //Checkout
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  //Notification
  GetPage(name: AppRoute.notification, page: () => const NotificationView()),
  //Tracking
  GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),
];
