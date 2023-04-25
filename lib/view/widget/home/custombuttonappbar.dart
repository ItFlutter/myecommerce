import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  // final String textbutton;
  final void Function()? onPressed;
  final IconData icondata;
  final bool active;

  const CustomButtonAppBar(
      {Key? key,
      // required this.textbutton,
      this.onPressed,
      required this.icondata,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icondata,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // )
        ],
      ),
    );
  }
}
