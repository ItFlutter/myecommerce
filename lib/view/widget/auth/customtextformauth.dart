import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscureText;
  final Function()? onTapIcon;
  const CustomTextFormAuth(
      {Key? key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(iconData),
            ),
            label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(labeltext)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            )),
      ),
    );
  }
}
