import 'package:flutter/cupertino.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/models/products_model.dart';

class ProductsProvider extends ChangeNotifier {
  String _orderType = "Order by Popular";
  String get orderType => _orderType;

  bool _isListView = false;
  bool get isListView => _isListView;

  List<ProductsModel> categories = [
    ProductsModel(
        image: AppImages.shoes1,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 3),
    ProductsModel(
        image: AppImages.shoes2,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 2),
    ProductsModel(
        image: AppImages.shoes3,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 1),
    ProductsModel(
        image: AppImages.shoes4,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 4),
    ProductsModel(
        image: AppImages.shoes5,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 3),
    ProductsModel(
        image: AppImages.shoes6,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 5),
    ProductsModel(
        image: AppImages.shoes7,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 2),
    ProductsModel(
        image: AppImages.shoes8,
        name: "Sport Shoes",
        price: "\$1450.00",
        oldPrice: "\$999.99",
        stars: 4),
  ];
  // This method is used for change orderType of items
  changeOrderType(String value) {
    _orderType = value;
    notifyListeners();
  }
  // This method is used for change the view of items like GridView or ListView
  changeView(bool value) {
    _isListView = value;
    notifyListeners();
  }
}
