import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<String> myList = [
    "Sports Shoes",
    "Sports Hoddies",
    "Sports Pents",
    "Nike",
    "Bata",
  ];
  List<String> _searchList = [];
  List<String> get searchList => _searchList;

  /// this method is calling from an searchScreen TextField's onChanged method
  onChangeText(String text) {
    List<String> foundItems = [];
    if (text.isEmpty) {
      _searchList = [];
      notifyListeners();
    } else {
      myList.forEach((element) {
        if (element.toLowerCase().contains(text.toLowerCase())) {
          foundItems.add(element);
        }
      });
      _searchList = foundItems;
      notifyListeners();
    }
  }

  // This method is used for clear the list of searches
  clearData() {
    searchList.clear();
    notifyListeners();
  }
}
