import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String count;
  final String price;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
            ),
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 30,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(
                count,
                style: const TextStyle(height: 1, fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
            )
          ],
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontSize: 30, height: 1),
        )
      ],
    );
  }
}
