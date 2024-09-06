import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    required this.title,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 40,
          child: title
      ),
      leadingWidth: 25,
      actions: actions,
      bottom: bottom,
      backgroundColor: Colors.white, // Customize color if needed
      elevation: 0.0, // Customize elevation if needed
      centerTitle: false, // Center title in the AppBar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight + bottom!.preferredSize.height);
}
