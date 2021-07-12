import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_list/db_helper.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ShoppingData extends ChangeNotifier {

  ShoppingData() {
    getAllCategoriesFromDB();
    getAllItemsFromDB();
  }

  List<ShoppingItem> items = [];

  List<ShoppingCategory> categories = [];

  // List<ShoppingCategory> categories = [
  //   ShoppingCategory(id: 1, name: 'Fruit', priority: 1,),
  //   ShoppingCategory(id: 2, name: 'Vegetables', priority: 2),
  //   ShoppingCategory(id: 3, name: 'Bakery', priority: 1),
  // ];

  // List<ShoppingItem> items = [
  //   ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi', id: Random().nextInt(99)),
  //   ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now', id: Random().nextInt(99)),
  //   ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now', id: Random().nextInt(99)),
  //   ShoppingItem(categoryId: 2, name: 'Potato', quantity: '5', note: 'fresh', id: Random().nextInt(99)),
  //   ShoppingItem(categoryId: 3, name: 'Donuts', quantity: '12', note: 'krispy kreme', id: Random().nextInt(99)),
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

  void editCategory(ShoppingCategory modifiedCategory) async {
    await DbHelper.updateCategory(modifiedCategory);
    int indexToUpdate = categories.indexWhere((element) => element.id == modifiedCategory.id);
    categories[indexToUpdate] = modifiedCategory;
    print('Successfully updated category in local and db');
    modifiedCategory.printCategory();
    notifyListeners();
  }

  void removeCategory(int id) async {
    await DbHelper.deleteCategory(id);
    categories.removeWhere((element) => element.id == id);
    print('Successfully removed category from local and db');
    List<int> idsItemsToDelete = items.where((element) => element.categoryId == id).map((e) => e.id).toList();
    idsItemsToDelete.forEach((itemId) async {
      await DbHelper.deleteItem(itemId);
    });
    items.removeWhere((element) => element.categoryId == id);
    print('Successfully removed all items in old category from local and db');
    notifyListeners();
  }

  void getAllItemsFromDB() async {
    items = await DbHelper.getAllItems();
    notifyListeners();
  }

  void addItem(int newItemCategoryId, String newName, String newQuantity, String newNote) async {
    ShoppingItem newItem = ShoppingItem(categoryId: newItemCategoryId, name: newName, quantity: newQuantity, note: newNote, id: 0);
    newItem.id = await DbHelper.insertItem(newItem);
    items.add(newItem);
    notifyListeners();
  }

  void editItem(int itemId, int categoryId, String newName, String newQuantity, String newNote) async {
    ShoppingItem modifiedItem = ShoppingItem(id: itemId, categoryId: categoryId, name: newName, quantity: newQuantity, note: newNote);
    await DbHelper.updateItem(modifiedItem);
    int indexToModify = items.indexWhere((element) => element.id == itemId);
    items[indexToModify] = modifiedItem;
    notifyListeners();
  }

  void removeItem(int itemId) async {
    await DbHelper.deleteItem(itemId);
    items.removeWhere((element) => element.id == itemId);
    notifyListeners();
  }


}