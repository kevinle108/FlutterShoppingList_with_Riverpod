import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ShoppingData extends ChangeNotifier {

  List<ShoppingItem> items = [
    ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 2, name: 'Potato', quantity: '5', note: 'fresh', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 3, name: 'Donuts', quantity: '12', note: 'krispy kreme', id: Random().nextInt(99)),
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

  void editCategory(int catId, String newName, int newPriority) {
    ShoppingCategory categoryToEdit = categories.firstWhere((category) => category.id == catId);
    categoryToEdit.name = newName;
    categoryToEdit.priority = newPriority;
    notifyListeners();
  }

  void addItem(int newItemCategoryId, String newItem, String newQuantity, String newNote) {
    print('Inside ShoppingData.addItem()');
    print('newItem: ${newItem}, newQuantity: ${newQuantity}, newNote: ${newNote}');
    items.add(ShoppingItem(categoryId: newItemCategoryId, name: newItem, quantity: newQuantity, note: newNote, id: Random().nextInt(99)));
    notifyListeners();
  }

  void editItem(int itemId, String newName, String newQuantity, String newNote) {
    ShoppingItem itemToEdit = items.firstWhere((item) => item.id == itemId);
    itemToEdit.name = newName;
    itemToEdit.quantity = newQuantity;
    itemToEdit.note = newNote;
    notifyListeners();
  }

  void removeItem(int itemId) {
    ShoppingItem itemToRemove = items.firstWhere((item) => item.id == itemId);
    items.remove(itemToRemove);
    notifyListeners();
  }


}