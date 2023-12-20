import 'package:flutter/material.dart';
import 'package:pony_collection/helper/my_text_styles.dart';

class WelcomeItemCards extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final Function() onTap;
  const WelcomeItemCards(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(icon),
            title: Text(
              title,
              style: MyTextStyles.normalStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            subtitle: Text(
              subTitle,
            ),
          ),
        ),
      ),
    );
  }
}
