import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomTopLanguageLogo extends StatelessWidget {
  const CustomTopLanguageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        child: Image.asset(AppImageAsset.languageLogo,
            // alignment: Alignment.topLeft,
            height: 200,
            width: 200));
  }
}
