import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          CustomAppBar(
              titleappbar: "Find Product",
              onPressedIcon: () {},
              onPressedSearch: () {}),
          const SizedBox(
            height: 20,
          ),
          const ListCategoriesItems(),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.6),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {},
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${AppLink.imageitems}/laptop.png",
                          width: 170,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        const Text("Laptop Surface Go",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold)),
                        const Text(
                          "description how are you ahmad",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColor.grey2, fontSize: 13),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "200.10\$",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: "sans"),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
                )),
          )
        ],
      ),
    ));
  }
}
