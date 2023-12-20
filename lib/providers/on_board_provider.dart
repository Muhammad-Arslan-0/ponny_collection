import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_images.dart';

import '../models/on_board_model.dart';

class OnBoardProvider extends ChangeNotifier {
  List<OnBoardModel> boardingModels = [
    OnBoardModel(
        text:
            "Life is a succession of lessons which must be lived to be understood.",
        image: AppImages.bag),
    OnBoardModel(
        text:
            "You come into the world with nothing, and the purpose of your life is to make something out of nothing.",
        image: AppImages.mobile),
    OnBoardModel(
        text: "Life is what happens while you are busy making other plans.",
        image: AppImages.truck),
    OnBoardModel(text: "", image: null),
  ];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  // This method is used for change the index of onboard Carousel slider
  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
