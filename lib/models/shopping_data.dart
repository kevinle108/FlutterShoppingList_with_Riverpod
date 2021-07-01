import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ShoppingData extends ChangeNotifier {

  List<ShoppingItem> items = [
    ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi'),
    ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now'),
    ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now'),
    ShoppingItem(categoryId: 2, name: 'Potato', quantity: '5', note: 'fresh'),
    ShoppingItem(categoryId: 3, name: 'Donuts', quantity: '12', note: 'krispy kreme'),
  ];

  List<ShoppingCategory> categories = [
    ShoppingCategory(id: 1, name: 'Fruit', priority: 1,),
    ShoppingCategory(id: 2, name: 'Vegetables', priority: 2),
    ShoppingCategory(id: 3, name: 'Bakery', priority: 1),
  ];

  void addCategory(String newCategory, int newPriority, int newCategoryId) {
    categories.add(ShoppingCategory(name: newCategory, priority: newPriority, id: newCategoryId),);
    notifyListeners();
  }

  // todo note: categoryPriority is passed as a string and not an int
  // todo implement later using the category id instead
  void editCategory(String originalName, String newName, String categoryPriority) {
    if (originalName != newName) {
      categories.firstWhere((category) => category.name == originalName).name = newName;
      notifyListeners();
    }
  }

  void addItem(int newItemCategoryId, String newItem, String newQuantity, String newNote) {
    print('Inside ShoppingData.addItem()');
    print('newItem: ${newItem}, newQuantity: ${newQuantity}, newNote: ${newNote}');
    items.add(ShoppingItem(categoryId: newItemCategoryId, name: newItem, quantity: newQuantity, note: newNote));
    notifyListeners();
  }


}