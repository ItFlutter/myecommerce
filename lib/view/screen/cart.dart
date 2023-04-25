import 'dart:ui';

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import "package:flutter/material.dart";

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Cart",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2, child: Image.asset(AppImageAsset.logo2)),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Macbook M2 Max",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "300.00 \$",
                              style: TextStyle(
                                  fontSize: 17, color: AppColor.primaryColor),
                            ),
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          Text("2",
                              style: TextStyle(
                                fontFamily: "1",
                              )),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
