import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isactive;
  const CardShippingAddressCheckout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isactive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: isactive ? AppColor.secondryColor : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isactive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isactive ? Colors.white : null),
        ),
      ),
    );
  }
}
