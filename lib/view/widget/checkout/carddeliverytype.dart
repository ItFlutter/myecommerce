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
      width: 150,
      height: 160,
      margin: const EdgeInsets.only(top: 10, right: 10),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          // color: active ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(10),
          border: active ? Border.all(color: AppColor.primaryColor) : null),
      // width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 130,
            height: 110,
            fit: BoxFit.cover,
            // color: active ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                // color: active ? Colors.white : AppColor.secondryColor,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
