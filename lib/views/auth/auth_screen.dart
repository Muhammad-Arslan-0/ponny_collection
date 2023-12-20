import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/helper/route_constants.dart';

import '../../helper/app_images.dart';
import '../../helper/my_text_styles.dart';
import '../../widgets/auth_field.dart';

class AuthScreen extends StatelessWidget {
  final bool isLogin;
  AuthScreen({super.key, required this.isLogin});
  final TextEditingController loginUserNameController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController signUpUserNameController =
      TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpRePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: isLogin ? 0 : 1,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(AppImages.bgAuth,
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.fitHeight),
            Container(
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black.withOpacity(.5),
            ),
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: TabBar(
                        dividerHeight: 0,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.white,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                            child: Text(
                              "LOG IN",
                              style: MyTextStyles.montBoldStyle,
                            ),
                          ),
                          Tab(
                            child: Text(
                              "SIGN UP",
                              style: MyTextStyles.montBoldStyle,
                            ),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AuthField(
                                controller: loginUserNameController,
                                hintText: "Username",
                                isPassword: false),
                            AuthField(
                                controller: loginPasswordController,
                                hintText: "Password",
                                isPassword: true),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.sizeOf(context).width * .85,
                              child: GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .goNamed(RouteConstants.onBoardingScreen);
                                },
                                child: Text("LOG IN NOW",
                                    style: MyTextStyles.montBoldStyle.copyWith(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AuthField(
                                controller: loginUserNameController,
                                hintText: "Username",
                                isPassword: false),
                            AuthField(
                                controller: loginPasswordController,
                                hintText: "Password",
                                isPassword: true),
                            AuthField(
                                controller: loginPasswordController,
                                hintText: "Confirm Password",
                                isPassword: true),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.sizeOf(context).width * .85,
                              child: GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .goNamed(RouteConstants.onBoardingScreen);
                                },
                                child: Text("SIGN UP",
                                    style: MyTextStyles.montBoldStyle.copyWith(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
                SizedBox(height: 100)
              ],
            ),
            Positioned(
              right: 0,
              bottom: 70,
              child: Container(
                padding: EdgeInsets.all(25),
                width: MediaQuery.sizeOf(context).width * .80,
                decoration: BoxDecoration(
                    color: AppColors.facebookBtn,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Text(
                  "SIGN IN WITH FACEBOOK",
                  style: MyTextStyles.montBoldStyle
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
