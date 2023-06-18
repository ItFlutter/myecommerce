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
        Text(
          "$price\$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontSize: 30, height: 1),
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(20)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.remove,
                    size: 25,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 30,
              // decoration:
              //     BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(
                count,
                style: const TextStyle(
                  height: 1,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: AppColor.grey2),
                  borderRadius: BorderRadius.circular(20)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: onAdd,
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
