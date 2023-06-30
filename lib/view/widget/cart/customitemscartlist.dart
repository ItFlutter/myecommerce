import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String itemsPriceDiscount;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList(
      {Key? key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onAdd,
      required this.onRemove,
      required this.itemsPriceDiscount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageitems}/$imagename",
                height: 80,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${price}\$",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColor.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${itemsPriceDiscount}\$",
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   price,
                //   style: const TextStyle(
                //       fontSize: 17, color: AppColor.primaryColor),
                // ),
              )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 25,
                  child: IconButton(
                      onPressed: onAdd, icon: const Icon(Icons.add))),
              SizedBox(
                height: 25,
                child: Text(count,
                    style: const TextStyle(
                      fontFamily: "1",
                      height: 2,
                    )),
              ),
              SizedBox(
                height: 32,
                child: IconButton(
                    onPressed: onRemove, icon: const Icon(Icons.remove)),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
