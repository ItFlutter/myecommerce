import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonLang({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
