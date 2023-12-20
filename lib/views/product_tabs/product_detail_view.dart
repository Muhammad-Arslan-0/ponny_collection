import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/widgets/padding_widget.dart';

class ProductDetailView extends StatelessWidget {
  final String detail;
  const ProductDetailView({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(detail, style: TextStyle(fontSize: 20, color: Colors.amber)),
              Text(detail, style: TextStyle(fontSize: 20, color: Colors.red)),
              Text(detail,
                  style:
                      TextStyle(fontSize: 20, color: AppColors.gradientBtn1)),
              Text(detail,
                  style:
                      TextStyle(fontSize: 20, color: AppColors.gradientBtn2)),
            ],
          ),
        ),
      ),
    );
  }
}
