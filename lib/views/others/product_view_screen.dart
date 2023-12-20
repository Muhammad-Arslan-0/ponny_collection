import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/models/product_model.dart';
import 'package:pony_collection/views/product_tabs/general_view.dart';
import 'package:pony_collection/views/product_tabs/product_detail_view.dart';
import 'package:pony_collection/views/product_tabs/qa_view.dart';
import 'package:pony_collection/views/product_tabs/reviews_view.dart';

import '../../helper/app_images.dart';
import '../../widgets/my_appbar.dart';

class ProductViewScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductViewScreen({super.key, required this.productModel});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: Container(
        height: screenWidth * .15,
        width: screenWidth * .15,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.gradientBtn1,
                  AppColors.gradientBtn2,
                ]),
            shape: BoxShape.circle),
        child: Image.asset(AppImages.addCartIcon),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * .08),
          child: MyAppBar(title: widget.productModel.name)),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
                controller: controller,
                labelColor: AppColors.gradientBtn1,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 17),
                indicatorColor: AppColors.gradientBtn1,
                tabs: [
                  Tab(text: "General"),
                  Tab(text: "Product detail"),
                  Tab(text: "Q&A"),
                  Tab(text: "Reviews"),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: controller, children: [
              GeneralView(
                  controller: controller, productModel: widget.productModel),
              ProductDetailView(detail: widget.productModel.productDetail),
              QAView(questions: widget.productModel.questions),
              ReviewsView(reviews: widget.productModel.reviews),
            ]),
          )
        ],
      ),
    );
  }
}
