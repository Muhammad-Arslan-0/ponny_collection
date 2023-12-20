import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/route_constants.dart';
import '../../helper/app_images.dart';
import '../../helper/my_text_styles.dart';
import '../../widgets/auth_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.bgAuth,
              height: MediaQuery.sizeOf(context).height, fit: BoxFit.fitHeight),
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Colors.black.withOpacity(.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logo),
                    SizedBox(height: 30),
                    Text(
                      "WELCOME TO",
                      style: MyTextStyles.montSpacingStyle
                    ),
                    SizedBox(height: 6),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "PONY",
                          style: MyTextStyles.montBoldStyle
                              .copyWith(fontSize: 35, color: Colors.white),
                          children: [
                            TextSpan(
                                text: 'COLLECTION',
                                style: MyTextStyles.montNormalStyle.copyWith(
                                    fontSize: 35, color: Colors.white70))
                          ]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthButton(
                        text: "LOG IN",
                        onPressed: () {
                          GoRouter.of(context).pushNamed(
                              RouteConstants.authScreen,
                              extra: true);
                        },
                        isLoginBtn: true),
                    AuthButton(
                        text: "SIGN UP",
                        onPressed: () {
                          GoRouter.of(context).pushNamed(
                              RouteConstants.authScreen,
                              extra: false);
                        },
                        isLoginBtn: false),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
