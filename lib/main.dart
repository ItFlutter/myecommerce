import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/sevices/sevices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      // initialBinding: MyBinding(),
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home:
      // const Test(),
      //     const Language(),

      getPages: routes,
    );
  }
}
