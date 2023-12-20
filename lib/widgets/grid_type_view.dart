import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/widgets/stars_widget.dart';

import '../helper/app_colors.dart';
import '../helper/app_images.dart';
import '../helper/route_constants.dart';
import '../models/products_model.dart';
import '../models/product_model.dart';
import '../models/qa_model.dart';
import '../models/review_model.dart';

class GridTypeView extends StatelessWidget {
  final List<ProductsModel> categories;
  const GridTypeView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              ProductsModel category = categories[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(RouteConstants.productScreen,
                      extra:
                      ProductModel(
                          name: category.name,
                          price: category.price,
                          oldPrice: category.oldPrice,
                          review: "50",
                          stars: category.stars,
                          reviews: [
                            ReviewModel(
                                heading: "Good product, good cameras !",
                                time: "15 mins ago",
                                stars: 3,
                                name: "Sunny Vo",
                                comment:
                                    "No – one gets an iron – clad guarantee of success. Certainly, factors like opportunity, luck and timing are important. But the backbone of success is usually found in old – fashioned, basic concepts like hard work, determination, good planning and perseverance."),
                            ReviewModel(
                                heading: "Good product, good cameras !",
                                time: "15 mins ago",
                                stars: 3,
                                name: "Sunny Vo",
                                comment:
                                    "No – one gets an iron – clad guarantee of success. Certainly, factors like opportunity, luck and timing are important. But the backbone of success is usually found in old – fashioned, basic concepts like hard work, determination, good planning and perseverance."),
                            ReviewModel(
                                heading: "Good product, good cameras !",
                                time: "15 mins ago",
                                stars: 3,
                                name: "Sunny Vo",
                                comment:
                                    "No – one gets an iron – clad guarantee of success. Certainly, factors like opportunity, luck and timing are important. But the backbone of success is usually found in old – fashioned, basic concepts like hard work, determination, good planning and perseverance."),
                          ],
                          questions: [
                            QAModel(
                                image: AppImages.qa1,
                                name: "Olie Goldie",
                                question:
                                    "Life isn’t about waiting for the storm to pass. It’s about learning to dance in the rain.",
                                time: "15 mins ago"),
                            QAModel(
                                image: AppImages.qa2,
                                name: "Scott Shepard",
                                question:
                                    "Life isn’t about waiting for the storm to pass. It’s about learning to dance in the rain.",
                                time: "21 hrs ago"),
                            QAModel(
                                image: AppImages.qa3,
                                name: "Russell Marlett",
                                question:
                                    "Life isn’t about waiting for the storm to pass. It’s about learning to dance in the rain.",
                                time: "2 days ago")
                          ],
                          images: [
                            AppImages.shoes5,
                            AppImages.shoes6,
                            AppImages.shoes7,
                            AppImages.shoes8
                          ],
                          productDetail:
                              "Are you tired of slow, inefficient charging with too many wires that get tangled with each other? If you are, we have just the solution for you! Combining super-fast charging and wireless technology, Ivolks is proud to present…"));
                },
                child: Container(
                  width: screenWidth * .45,
                  height: screenWidth * .45,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth * .45,
                        width: screenWidth * .45,
                        child: Image.asset(category.image, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(category.price,
                                style: TextStyle(
                                    color: AppColors.gradientBtn1,
                                    fontSize: 18)),
                            Row(
                              children: [
                                Text(
                                  category.oldPrice,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  " (-50%)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            StarsWidget(
                                starLength: category.stars, starSize: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
