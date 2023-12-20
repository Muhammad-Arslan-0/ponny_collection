import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/helper/route_constants.dart';
import 'package:pony_collection/models/category_model.dart';
import 'package:pony_collection/models/popular_products_model.dart';
import 'package:pony_collection/providers/home_provider.dart';
import 'package:pony_collection/widgets/carousel_view.dart';
import 'package:provider/provider.dart';

import '../../models/flash_product_model.dart';
import '../drawer/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              Stack(
                children: [
                  CarouselView(
                      height: screenHeight * .4,
                      images: provider.homeHeaderImages),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Image.asset(AppImages.menu_icon)),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(RouteConstants.searchScreen);
                              },
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: InputBorder.none,
                                    hintText: "Search.."),
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .pushNamed(RouteConstants.cartScreen);
                                  },
                                  child: Image.asset(AppImages.cart_icon)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "show more",
                            style: TextStyle(
                                color: AppColors.gradientBtn1, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                        itemCount: provider.categories.length,
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          CategoryModel category = provider.categories[index];
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                  RouteConstants.categoriesScreen,
                                  extra: category.text);
                            },
                            child: Column(children: [
                              Image.asset(category.image),
                              Text(category.text,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ]),
                          );
                        })
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      width: screenWidth,
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Popular keywords",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    GridView.builder(
                        itemCount: provider.popularProducts.length,
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          PopularProductsModel popularProduct =
                              provider.popularProducts[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(popularProduct.image,
                                  fit: BoxFit.cover),
                              SizedBox(width: 5),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(popularProduct.title,
                                        style: TextStyle(
                                            fontSize: 22,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.greyTextColor)),
                                    Text(popularProduct.subTitle,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.greyTextColor)),
                                  ]),
                            ],
                          );
                        })
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Flash sale",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "show more",
                            style: TextStyle(
                                color: AppColors.gradientBtn1, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppColors.gradientBtn1,
                        AppColors.gradientBtn2
                      ])),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Finish on",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                        child: Text(
                                      "18",
                                      style: TextStyle(fontSize: 18),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(":",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                        child: Text(
                                      "59",
                                      style: TextStyle(fontSize: 18),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(":",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                        child: Text(
                                      "59",
                                      style: TextStyle(fontSize: 18),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppImages.samsungPhone),
                            Text("Galaxy Note 8",
                                style: TextStyle(fontSize: 20)),
                            Text("\$450",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.gradientBtn1)),
                            Row(
                              children: [
                                Text("\$999.00",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                                Text("  ( -50% )",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20))
                              ],
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black26,
                          width: 2,
                          height: 150,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: provider.flashSaleProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                FlashProductModel flashProduct =
                                    provider.flashSaleProducts[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(flashProduct.image,
                                        fit: BoxFit.cover),
                                    SizedBox(width: 5),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(flashProduct.price,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color:
                                                      AppColors.gradientBtn1)),
                                          Text(flashProduct.oldPrice,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color:
                                                      AppColors.greyTextColor)),
                                        ]),
                                  ],
                                );
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
