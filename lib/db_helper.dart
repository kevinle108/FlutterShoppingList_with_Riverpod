import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const kTableCategories = 'categories';
const kTableItems = 'items';


class DbHelper {
  static Database? _db;

  static Future<Database> _getDb() async {
    if (_db == null) {
      print('inside _getDb');
      _db = await openDatabase(
        join(await getDatabasesPath(), 'shopping.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute('CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
          return await db.execute('CREATE TABLE items(id INTEGER PRIMARY KEY, categoryId INTEGER, name TEXT, quantity TEXT, note TEXT)');
        },
      );
      print('database shopping.db is opened');
    }
    return _db!;
  }

  static Future<List<ShoppingCategory>> getAllCategories() async {
    Database db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(kTableCategories);
    print('Read ${maps.length} categories from the database');
    return List.generate(
        maps.length,
            (i) => ShoppingCategory(
            id: maps[i]['id'],
            name: maps[i]['name'],
            priority: maps[i]['priority']));
  }

  static Future<int> insertCategory(ShoppingCategory category) async {
    Database db = await _getDb();
    print('inserting new category into db');
    return await db.insert(kTableCategories, category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCategory(int id) async {
    Database db = await _getDb();
    return await db.delete(kTableCategories, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateCategory(ShoppingCategory category) async {
    Database db = await _getDb();
    return await db.update(kTableCategories, category.toMap(),
        where: 'id = ?', whereArgs: [category.id]);
  }

  static Future<List<ShoppingItem>> getAllItems() async {
    Database db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(kTableItems);
    print('Read ${maps.length} items from the database');
    return List.generate(
        maps.length,
            (i) => ShoppingItem(
            id: maps[i]['id'],
            categoryId: maps[i]['categoryId'],
            name: maps[i]['name'],
            quantity: maps[i]['quantity'],
            note: maps[i]['note']));
  }

  static Future<int> insertItem(ShoppingItem newItem) async {
    Database db = await _getDb();
    print('inserting new item into db');
    return await db.insert(kTableItems, newItem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateItem(ShoppingItem item) async {
    Database db = await _getDb();
    return await db.update(kTableItems, item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }



  // static Future<int> insertItem(ShoppingItem newItem) async {
  //   Database db = await _getDb();
  //
  //
  // }
}

