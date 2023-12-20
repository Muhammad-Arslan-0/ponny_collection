import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/helper/my_text_styles.dart';
import 'package:pony_collection/services/shared_pref_services.dart';

import '../../helper/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataFromPref();
    // Future.delayed(Duration(seconds: 3), () {
    //   GoRouter.of(context).goNamed(RouteConstants.firstScreen);
    // });
  }

  getDataFromPref() async {
    bool? value = await SharedPrefServices.getValue();
    if (value == null || value == false) {
      Future.delayed(Duration(seconds: 2), () {
        GoRouter.of(context).goNamed(RouteConstants.firstScreen);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        GoRouter.of(context).goNamed(RouteConstants.homeScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.bgAuth,
              height: screenHeight, fit: BoxFit.fitHeight),
          Container(
            height: screenHeight,
            color: Colors.black.withOpacity(.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo),
                SizedBox(height: 30),
                Text(
                  "WELCOME TO",
                  style: MyTextStyles.montSpacingStyle,
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
                            style: MyTextStyles.montNormalStyle
                                .copyWith(fontSize: 35, color: Colors.white70))
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
