import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/db_helper.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ShoppingData extends ChangeNotifier {

  ShoppingData() {
    getAllCategoriesFromDB();
  }


  List<ShoppingItem> items = [
    ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 2, name: 'Potato', quantity: '5', note: 'fresh', id: Random().nextInt(99)),
    ShoppingItem(categoryId: 3, name: 'Donuts', quantity: '12', note: 'krispy kreme', id: Random().nextInt(99)),
  ];

  List<ShoppingCategory> categories = [
  ];

  // List<ShoppingCategory> categories = [
  //   ShoppingCategory(id: 1, name: 'Fruit', priority: 1,),
  //   ShoppingCategory(id: 2, name: 'Vegetables', priority: 2),
  //   ShoppingCategory(id: 3, name: 'Bakery', priority: 1),
  // ];

  void getAllCategoriesFromDB() async {
    categories = await DbHelper.getAllCategories();
    notifyListeners();
  }

  void addCategory(String newName, int newPriority, int newCategoryId) async {
    ShoppingCategory newCategory = ShoppingCategory(name: newName, priority: newPriority, id: 0);
    newCategory.id = await DbHelper.insertCategory(newCategory);
    categories.add(newCategory);
    print('Successfully added category to local and db');
    newCategory.printCategory();
    notifyListeners();
  }

  //todo use db
  void editCategory(int catId, String newName, int newPriority) {
    ShoppingCategory categoryToEdit = categories.firstWhere((category) => category.id == catId);
    categoryToEdit.name = newName;
    categoryToEdit.priority = newPriority;
    notifyListeners();
  }

  //todo use db
  void removeCategory(int catId) {
    ShoppingCategory categoryToRemove = categories.firstWhere((category) => category.id == catId);
    categories.remove(categoryToRemove);
    items = items.where((item) => item.categoryId != catId).toList();
    notifyListeners();
  }


  void addItem(int newItemCategoryId, String newItem, String newQuantity, String newNote) {
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