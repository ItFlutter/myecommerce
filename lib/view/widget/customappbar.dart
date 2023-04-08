import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIcon;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      this.onPressedIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
              hintText: titleappbar,
              hintStyle: const TextStyle(fontWeight: FontWeight.w500),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onPressedSearch,
              ),
              fillColor: Colors.grey[200],
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
        )),
        Container(
          height: 60,
          width: 55,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.grey[600],
                size: 26,
              ),
              onPressed: onPressedIcon),
        ),
      ],
    );
  }
}
