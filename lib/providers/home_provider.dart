import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/models/flash_product_model.dart';

import '../models/category_model.dart';
import '../models/popular_products_model.dart';

class HomeProvider extends ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(image: AppImages.book, text: "Books"),
    CategoryModel(image: AppImages.food, text: "Foods"),
    CategoryModel(image: AppImages.electronic, text: "Electronics"),
    CategoryModel(image: AppImages.computer, text: "Computers"),
    CategoryModel(image: AppImages.cellphone, text: "Cellphones"),
    CategoryModel(image: AppImages.office, text: "Offices"),
    CategoryModel(image: AppImages.shoe, text: "Shoes"),
    CategoryModel(image: AppImages.fashion, text: "Fashions"),
    CategoryModel(image: AppImages.collection, text: "Collections"),
  ];
  List<PopularProductsModel> popularProducts = [
    PopularProductsModel(
        image: AppImages.heniken, title: "Heniken", subTitle: "155 Products"),
    PopularProductsModel(
        image: AppImages.macbook, title: "Macbook", subTitle: "1,000 Products"),
    PopularProductsModel(
        image: AppImages.flycam, title: "Flycam", subTitle: "1,000 Products"),
    PopularProductsModel(
        image: AppImages.iphone, title: "Iphone", subTitle: "2,000 Products"),
  ];
  List<FlashProductModel> flashSaleProducts = [
    FlashProductModel(
        image: AppImages.flash1,
        price: "\$250.00",
        oldPrice: "\$999.00",
        discount: "-75%"),
    FlashProductModel(
        image: AppImages.flash2,
        price: "\$250.00",
        oldPrice: "\$999.00",
        discount: "-50%"),
    FlashProductModel(
        image: AppImages.flash3,
        price: "\$250.00",
        oldPrice: "\$999.00",
        discount: "-50%"),
  ];
  List<String> homeHeaderImages = [
    AppImages.homeHeaderBg1,
    AppImages.homeHeaderBg2,
    AppImages.homeHeaderBg3,
    AppImages.homeHeaderBg4,
    AppImages.homeHeaderBg5,
  ];
}
