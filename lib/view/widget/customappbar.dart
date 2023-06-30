import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  // final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavotite;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  final IconData? iconData;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      // this.onPressedIcon,
      required this.onPressedIconFavotite,
      required this.onChanged,
      required this.mycontroller,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          style: const TextStyle(height: 0.9),
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
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        )),
        // const SizedBox(
        //   width: 10,
        // ),
        // Container(
        //   height: 60,
        //   width: 55,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        //   child: IconButton(
        //       icon: Icon(
        //         Icons.notifications_active_outlined,
        //         color: Colors.grey[600],
        //         size: 26,
        //       ),
        //       onPressed: onPressedIcon),
        // ),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.grey[200]),
          child: IconButton(
              icon: Icon(
                iconData,
                color: Colors.grey[600],
                size: 26,
              ),
              onPressed: onPressedIconFavotite),
        ),
      ],
    );
  }
}
