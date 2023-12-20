import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/my_text_styles.dart';
import 'package:pony_collection/helper/route_constants.dart';
import 'package:pony_collection/services/shared_pref_services.dart';
import 'package:pony_collection/widgets/welcome_item_cards.dart';

import '../../helper/app_colors.dart';
import '../../helper/app_images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(AppImages.bgAuth,
            height: screenHeight, fit: BoxFit.fitHeight),
        Container(
          height: screenHeight,
          color: Colors.black.withOpacity(.5),
        ),
        Container(
          height: screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                AppColors.onBoardHeader.withOpacity(.9),
                AppColors.gradientBtn2.withOpacity(.9),
              ])),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome to Pony, an e-commerce app !",
                    style: MyTextStyles.boldStyle.copyWith(color: Colors.white)),
                SizedBox(height: 30),
                Text(
                    "There are also country specific classified online sites like usfreeads.com for United States. There are a number of agencies throughout the world that have made a business out of the classified advertising industry.",
                    style: MyTextStyles.boldStyle
                        .copyWith(color: Colors.white, fontSize: 20)),
                SizedBox(height: 30),
                WelcomeItemCards(
                    onTap: () async {
                      await SharedPrefServices.setValue(true);
                      GoRouter.of(context).goNamed(RouteConstants.homeScreen);
                    },
                    title: "Go to the Home page",
                    subTitle: "Start to explore your shopping paradise",
                    icon: AppImages.home_icon),
                WelcomeItemCards(
                    onTap: () {},
                    title: "Search your products",
                    subTitle: "You can search what you need so quick",
                    icon: AppImages.search_icon),
                WelcomeItemCards(
                    onTap: () {},
                    title: "You need the help ?",
                    subTitle: "Support team can help you 24/7",
                    icon: AppImages.help_icon),
              ],
            ),
          ),
        )
      ],
    );
  }
}
