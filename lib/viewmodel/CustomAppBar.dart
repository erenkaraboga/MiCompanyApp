import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
    required this.openDrawer,
    required this.icon,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: openDrawer, icon: icon
      ),
      backgroundColor: Colors.white,
      title: Center(
        child: Container(
          padding: EdgeInsetsDirectional.only(end: 30),
          child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
