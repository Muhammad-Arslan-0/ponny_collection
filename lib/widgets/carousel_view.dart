import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../helper/app_colors.dart';

class CarouselView extends StatelessWidget {
  final double height;
  final List<String> images;
  const CarouselView ({super.key,required this.height,required this.images});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.sizeOf(context).width;
    return Container(
      height: height,
      child: CarouselSlider.builder(
        enableAutoSlider: true,
        autoSliderTransitionCurve: Curves.easeIn,
        slideTransform: ParallaxTransform(),
        unlimitedMode: true,
        itemCount: images.length,
        slideBuilder: (index) {
          String image = images[index];
          return Image.asset(
            image,
            width: screenWidth,
            fit: BoxFit.cover,
          );
        },
        viewportFraction: 1,
        slideIndicator: CircularSlideIndicator(
          indicatorBackgroundColor: Colors.transparent,
          currentIndicatorColor: AppColors.gradientBtn1,
          indicatorBorderColor: Colors.grey,
          indicatorBorderWidth: 1.5,
          padding: EdgeInsets.only(bottom: 32),
        ),
      ),
    );
  }
}
