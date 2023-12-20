import 'package:flutter/material.dart';
import 'package:pony_collection/models/product_model.dart';
import 'package:pony_collection/widgets/padding_widget.dart';
import 'package:pony_collection/widgets/review_star.dart';

import '../../helper/app_colors.dart';
import '../../helper/app_images.dart';
import '../../models/qa_model.dart';
import '../../models/review_model.dart';
import '../../widgets/carousel_view.dart';
import '../../widgets/size_box_widget.dart';
import '../../widgets/stars_widget.dart';

class GeneralView extends StatelessWidget {
  final ProductModel productModel;
  final TabController controller;
  const GeneralView(
      {super.key, required this.productModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselView(height: screenHeight * .3, images: productModel.images),
          PaddingWidget(
            child: Container(
              color: Colors.white,
              width: screenWidth,
              child: PaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.name, style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        Text(
                          productModel.price,
                          style: TextStyle(
                              color: AppColors.gradientBtn1, fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Text(
                          productModel.oldPrice,
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "(-50%)",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            StarsWidget(
                                starLength: productModel.stars, starSize: 20),
                            Text("(${productModel.review})"),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppImages.shareIcon),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(AppImages.wishlistIcon),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          PaddingWidget(
            child: Container(
                color: Colors.white,
                width: screenWidth,
                child: PaddingWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product detail", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(productModel.productDetail,
                            style: TextStyle(fontSize: 16)),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            controller.animateTo(1,
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 100));
                          },
                          child: Text("VIEW DETAIL",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          PaddingWidget(
            child: Container(
                color: Colors.white,
                width: screenWidth,
                child: PaddingWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.animateTo(2,
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 100));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Q&A (143)", style: TextStyle(fontSize: 20)),
                            Icon(Icons.navigate_next, size: 30)
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount:
                              productModel.questions.take(3).toList().length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            QAModel myQuestion = productModel.questions[index];
                            return Column(
                              children: [
                                if (index != 0) Divider(thickness: 2),
                                ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(myQuestion.image),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(myQuestion.name,
                                            style: TextStyle(fontSize: 20)),
                                        Text(myQuestion.time)
                                      ],
                                    ),
                                    subtitle: Text(
                                      myQuestion.question,
                                      style: TextStyle(fontSize: 16),
                                    )),
                              ],
                            );
                          })
                    ],
                  ),
                )),
          ),
          PaddingWidget(
              child: Container(
                  color: Colors.white,
                  width: screenWidth,
                  child: PaddingWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.animateTo(3,
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 100));
                          },
                          child: Text("Reviews & Comments",
                              style: TextStyle(fontSize: 20)),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StarsWidget(
                                        starLength: productModel.stars,
                                        starSize: 25),
                                    SizedBox(height: 20),
                                    RichText(
                                        text: TextSpan(
                                            children: [
                                          TextSpan(
                                              text: " of 5 (250 review)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16))
                                        ],
                                            text:
                                                "${productModel.stars.toDouble()}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20))),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ReviewStar(
                                        stars: 5, reviewCount: "72", value: 60),
                                    ReviewStar(
                                        stars: 4, reviewCount: "34", value: 40),
                                    ReviewStar(
                                        stars: 3, reviewCount: "22", value: 30),
                                    ReviewStar(
                                        stars: 2, reviewCount: "11", value: 20),
                                    ReviewStar(
                                        stars: 1, reviewCount: "08", value: 10),
                                  ],
                                )
                              ],
                            )),
                        Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppColors.gradientBtn1, width: 3)),
                            child: Center(
                                child: Text(
                              "WRITE A REVIEW NOW",
                              style: TextStyle(
                                  color: AppColors.gradientBtn1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Divider(thickness: 2),
                        ListView.builder(
                            itemCount: productModel.reviews.length,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              ReviewModel review = productModel.reviews[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (index != 0) Divider(thickness: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      child: StarsWidget(
                                          starLength: review.stars,
                                          starSize: 20)),
                                  SizeBoxWidget(
                                    child: Text("By ${review.name}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18)),
                                  ),
                                  SizeBoxWidget(
                                    child: Text(review.comment,
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ))),
          PaddingWidget(
            child: Container(
                color: Colors.white,
                width: screenWidth,
                child: PaddingWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Related Products",
                              style: TextStyle(fontSize: 20)),
                          Icon(
                            Icons.navigate_next,
                            size: 25,
                          )
                        ],
                      ),
                      Container(
                        height: screenHeight * .25,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: screenWidth * .3,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: screenWidth * .3,
                                            child: Image.asset(AppImages.shoes1,
                                                fit: BoxFit.cover)),
                                        Text("Maxson Man's Ultra Light Weight",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis),
                                        Text("\$800.00",
                                            style: TextStyle(
                                                color: AppColors.gradientBtn1,
                                                fontSize: 18)),
                                      ]),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
