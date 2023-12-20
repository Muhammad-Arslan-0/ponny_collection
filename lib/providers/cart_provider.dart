import 'package:flutter/cupertino.dart';
import 'package:pony_collection/helper/app_images.dart';

import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartItems = [
    CartModel(
        image: AppImages.cart1,
        name: "Shoes",
        size: "XL",
        price: "\$900.00",
        quantity: "1"),
    CartModel(
        image: AppImages.cart2,
        name: "Sandals",
        size: "M",
        price: "\$450.00",
        quantity: "2"),
    CartModel(
        image: AppImages.cart3,
        name: "Helmet",
        size: "L",
        price: "\$500.00",
        quantity: "3"),
    CartModel(
        image: AppImages.cart4,
        name: "Pents",
        size: "XL",
        price: "\$950.00",
        quantity: "1"),

    CartModel(
        image: AppImages.cart4,
        name: "Pents",
        size: "XL",
        price: "\$950.00",
        quantity: "1"),

    CartModel(
        image: AppImages.cart4,
        name: "Pents",
        size: "XL",
        price: "\$950.00",
        quantity: "1"),

    CartModel(
        image: AppImages.cart4,
        name: "Pents",
        size: "XL",
        price: "\$950.00",
        quantity: "1"),
  ];
  // This Method is used in CartScreen for change the quantity of items in cart
  changeQuantity(String quantity, CartModel cartItem) {
    cartItem.quantity = quantity;
    notifyListeners();
  }
}
