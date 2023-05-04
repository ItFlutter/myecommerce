import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavigationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Price",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shipping",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                shipping,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Totla Price",
                style: TextStyle(
                    fontSize: 17,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                totalprice,
                style: const TextStyle(
                    fontSize: 17,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        CustomButtonCart(
          text: "Place Order",
          onPressed: () {},
        )
      ],
    );
  }
}
