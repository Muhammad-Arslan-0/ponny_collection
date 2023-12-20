import 'package:flutter/material.dart';

import '../helper/app_colors.dart';


class DrawerItem extends StatelessWidget {
  final String img;
  final String title;
  final Function() onTap;
  const DrawerItem(
      {super.key, required this.img, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(img, color: AppColors.gradientBtn1),
        title: Text(title, style: TextStyle(color: AppColors.gradientBtn1,fontSize: 20)),
      ),
    );
  }
}
