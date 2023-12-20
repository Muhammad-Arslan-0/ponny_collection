import 'package:flutter/material.dart';

import '../helper/app_colors.dart';
import '../helper/my_text_styles.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .85,
        color: AppColors.textFieldBg,
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: MyTextStyles.montBoldStyle.copyWith(
                color: Colors.white,
                fontSize: 15
              )),
        ),
      ),
    );
  }
}
