import 'package:flutter/material.dart';
import 'package:pony_collection/widgets/padding_widget.dart';
import 'package:pony_collection/widgets/size_box_widget.dart';

import '../../models/review_model.dart';
import '../../widgets/stars_widget.dart';

class ReviewsView extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewsView({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
            itemCount: reviews.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              ReviewModel review = reviews[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index != 0) Divider(thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          review.heading,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        review.time,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizeBoxWidget(
                      child:
                          StarsWidget(starLength: review.stars, starSize: 20)),
                  SizeBoxWidget(
                    child: Text("By ${review.name}",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
                  ),
                  SizeBoxWidget(
                      child:
                          Text(review.comment, style: TextStyle(fontSize: 16))),
                ],
              );
            }),
      ),
    );
  }
}
