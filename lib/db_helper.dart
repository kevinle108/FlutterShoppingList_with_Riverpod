import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const kTableCategories = 'categories';


class DbHelper {
  static Database? _db;

  static Future<Database> _getDb() async {
    if (_db == null) {
      print('inside _getDb');
      _db = await openDatabase(
        join(await getDatabasesPath(), 'categories.db'),
        version: 1,
        onCreate: (db, version) async {
          return await db.execute(
              'CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
        },
      );
      print('database categories.db is opened');
    }
    return _db!;
  }

  static Future<int> insertCategory(ShoppingCategory category) async {
    Database db = await _getDb();
    print('inserting db');
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
}

