import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ShoppingData extends ChangeNotifier {
  // List<ShoppingCategory> categories = [
  //
  // ];

  List<ShoppingItem> items = [

  ];

  // List<ShoppingItem> shoppingItems = [
  //   ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi'),
  //   ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now'),
  //   ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now'),
  // ];

  List<ShoppingCategory> categories = [
    ShoppingCategory(name: 'Fruit', priority: 1),
    ShoppingCategory(name: 'Vegetables', priority: 2),
    ShoppingCategory(name: 'Bakery', priority: 1),
  ];

  void addCategory(String newCategory, int newPriority) {
    categories.add(ShoppingCategory(name: newCategory, priority: newPriority),);
    notifyListeners();
  }


}