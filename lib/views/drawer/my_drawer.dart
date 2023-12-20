import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/helper/route_constants.dart';
import 'package:pony_collection/widgets/drawer_items.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        right: screenWidth * .06, //40
                        top: screenWidth * .02, //10
                        child: Container(
                          height: screenWidth * .13, //50
                          width: screenWidth * .13, //50
                          decoration: BoxDecoration(
                              color: AppColors.gradientBtn2.withOpacity(.8),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * .06,
                        bottom: screenWidth * .065,
                        child: Container(
                          height: screenWidth * .08,
                          width: screenWidth * .08,
                          decoration: BoxDecoration(
                              color: AppColors.gradientBtn1.withOpacity(.9),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Container(
                          height: screenWidth * .40, //180
                          width: screenWidth * .40, //180
                          child: Image.asset(AppImages.profileImg)),
                      Positioned(
                        right: screenWidth * .02, //10
                        top: screenWidth * .1, //40
                        child: Container(
                          height: screenWidth * .1, //40
                          width: screenWidth * .1, //40
                          decoration: BoxDecoration(
                              color: AppColors.gradientBtn1.withOpacity(.8),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * .065,
                        top: screenWidth * .065,
                        child: Container(
                          height: screenWidth * .06, //20
                          width: screenWidth * .06, //20
                          decoration: BoxDecoration(
                              color: AppColors.gradientBtn1.withOpacity(.9),
                              shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Sunny vo",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "vctung@outlook.com",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  DrawerItem(
                      img: AppImages.home_icon, title: "Home", onTap: () {}),
                  DrawerItem(
                      img: AppImages.categoryIcon,
                      title: "Categories",
                      onTap: () {
                        GoRouter.of(context).pop();
                        GoRouter.of(context).pushNamed(
                            RouteConstants.categoriesScreen,
                            extra: "Categories");
                      }),
                  DrawerItem(
                      img: AppImages.ordersIcon,
                      title: "My orders",
                      onTap: () {
                        GoRouter.of(context).pop();
                        GoRouter.of(context)
                            .pushNamed(RouteConstants.myOrdersScreen);
                      }),
                  DrawerItem(
                      img: AppImages.wishlistIcon,
                      title: "Wish list",
                      onTap: () {}),
                  DrawerItem(
                      img: AppImages.settingsIcon,
                      title: "Settings",
                      onTap: () {}),
                  DrawerItem(
                      img: AppImages.notificationIcon,
                      title: "Notifications",
                      onTap: () {}),
                  DrawerItem(
                      img: AppImages.help_icon,
                      title: "Help & FAQ",
                      onTap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
