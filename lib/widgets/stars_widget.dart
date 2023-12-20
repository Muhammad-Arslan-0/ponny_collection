import 'package:flutter/material.dart';

import '../helper/app_images.dart';

class StarsWidget extends StatelessWidget {
  final int starLength;
  final double starSize;
  const StarsWidget({super.key, required this.starLength,required this.starSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
              starLength,
              (index) => Container(
                    height: starSize,
                    width: starSize,
                    child: Image.asset(
                      AppImages.filledStar,
                      fit: BoxFit.cover,
                    ),
                  )),
        ),
        Row(
          children: List.generate(
              5 - starLength,
              (index) => Container(
                    height: starSize,
                    width: starSize,
                    child: Image.asset(
                      AppImages.outlinedStar,
                      fit: BoxFit.cover,
                    ),
                  )),
        ),
      ],
    );
  }
}
