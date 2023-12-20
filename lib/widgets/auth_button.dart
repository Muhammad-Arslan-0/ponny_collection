import 'package:flutter/material.dart';

import '../helper/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isLoginBtn;
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoginBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.sizeOf(context).width * .85,
          decoration: BoxDecoration(
              color: !isLoginBtn ? Colors.white : null,
              gradient: isLoginBtn
                  ? LinearGradient(colors: [
                      AppColors.gradientBtn1,
                      AppColors.gradientBtn1,
                      AppColors.gradientBtn2,
                    ])
                  : null,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: isLoginBtn ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
