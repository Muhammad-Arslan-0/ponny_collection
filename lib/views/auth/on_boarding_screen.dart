import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/providers/on_board_provider.dart';
import 'package:pony_collection/views/auth/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../../models/on_board_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<OnBoardProvider>(builder: (context, provider, child) {
        return provider.currentIndex == 3
            ? WelcomeScreen()
            : Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: screenHeight * .1,
                            color: AppColors.onBoardHeader,
                          ),
                          Image.asset(
                            AppImages.eaves,
                            height: screenHeight * .12,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Container(
                        height: screenHeight * .25,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                              AppColors.gradientBtn1,
                              AppColors.gradientBtn1,
                              AppColors.gradientBtn2,
                            ])),
                        child: Center(
                          child: Container(
                            height: 50,
                            child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          color: provider.currentIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          shape: BoxShape.circle),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: screenHeight * .28),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: provider.boardingModels.length,
                          viewportFraction: 1,
                          slideBuilder: (index) {
                            OnBoardModel board = provider.boardingModels[index];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  board.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                board.image != null
                                    ? Stack(
                                        children: [
                                          provider.currentIndex == 1
                                              ? Image.asset(AppImages.mobileBg)
                                              : SizedBox(),
                                          provider.currentIndex != 1
                                              ? Container(
                                                  child: Image.asset(
                                                    board.image!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Positioned(
                                                  right: screenWidth * .25,
                                                  left: screenWidth * .25,
                                                  child: Container(
                                                    child: Image.asset(
                                                      board.image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: screenHeight * .01,
                                )
                              ],
                            );
                          },
                          onSlideChanged: (index) {
                            provider.changeIndex(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
