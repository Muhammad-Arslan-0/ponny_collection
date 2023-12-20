import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/app_images.dart';
import '../helper/route_constants.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(
            Icons.navigate_before,
            size: 45,
            color: Colors.black54,
          )),
      leadingWidth: 30,
      title: Text(title, style: TextStyle(color: Colors.black54, fontSize: 30)),
      actions: [
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(RouteConstants.searchScreen);
            },
            child: Image.asset(AppImages.search_icon,
                color: Colors.black54, width: 25, height: 25)),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(RouteConstants.cartScreen);
            },
            child: Image.asset(AppImages.cart_icon, color: Colors.black54)),
      ],
    );
  }
}
