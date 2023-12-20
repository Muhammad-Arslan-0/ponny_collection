import 'package:flutter/material.dart';

import '../helper/app_images.dart';
import '../models/my_orders_model.dart';

class MyOrdersProvider extends ChangeNotifier {
  List<MyOrdersModel> orders = [
    MyOrdersModel(
        orderNo: "12345",
        bookDate: "Oct 1, 2018",
        image: AppImages.shoes4,
        name: "Sport shoes",
        price: "\$1450"),
    MyOrdersModel(
        orderNo: "34268",
        bookDate: "Oct 1, 2018",
        image: AppImages.shoes8,
        name: "Sport shoes",
        price: "\$1450"),
    MyOrdersModel(
        orderNo: "00034",
        bookDate: "Oct 1, 2018",
        image: AppImages.shoes3,
        name: "Sport shoes",
        price: "\$1450"),
    MyOrdersModel(
        orderNo: "00012",
        bookDate: "Oct 1, 2018",
        image: AppImages.shoes1,
        name: "Sport shoes",
        price: "\$1450"),
    MyOrdersModel(
        orderNo: "12358",
        bookDate: "Oct 1, 2018",
        image: AppImages.shoes7,
        name: "Sport shoes",
        price: "\$1450"),
  ];
}
