import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonSocial extends StatelessWidget {
  final void Function()? onTap;
  final String iconName;
  const CustomButtonSocial(
      {Key? key, required this.onTap, required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: CircleAvatar(
            backgroundColor: Color(0xFFF5F6F2),
            child: SvgPicture.asset(
              iconName,
            )));
  }
}
