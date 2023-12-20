import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../helper/app_colors.dart';

class ReviewStar extends StatelessWidget {
  final int stars;
  final String reviewCount;
  final double value;
  const ReviewStar({
    super.key,
    required this.stars,
    required this.reviewCount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Text("${stars} stars"),
          SizedBox(width: 5),
          Container(
            width: MediaQuery.sizeOf(context).width * .20,
            child: FAProgressBar(
              size: 15,
              borderRadius: BorderRadius.zero,
              currentValue: value,
              displayTextStyle: TextStyle(color: Colors.transparent),
              progressGradient: LinearGradient(
                  colors: [AppColors.gradientBtn1, AppColors.gradientBtn2]),
              backgroundColor: Colors.grey,
              displayText: '',
            ),
          ),
          SizedBox(width: 5),
          Text(reviewCount)
        ],
      ),
    );
  }
}
