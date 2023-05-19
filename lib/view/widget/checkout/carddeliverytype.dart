import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypecheckout extends StatelessWidget {
  final String title;
  final String imageName;
  final bool active;
  const CardDeliveryTypecheckout(
      {Key? key,
      required this.title,
      required this.imageName,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
          color: active ? AppColor.secondryColor : null,
          border: Border.all(color: AppColor.secondryColor)),
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              width: 60,
              color: active ? Colors.white : null,
            ),
            Text(
              title,
              style: TextStyle(
                  color: active ? Colors.white : AppColor.secondryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
