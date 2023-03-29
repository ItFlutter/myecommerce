import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonOnBoarding({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.primaryColor,
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: onPressed,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
