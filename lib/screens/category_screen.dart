import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:flutter_shopping_list/widgets/edit_shopping_list_card.dart';
import 'package:flutter_shopping_list/widgets/item_card.dart';

class CategroryScreen extends StatelessWidget {
  String itemName;

  List<ShoppingItem> shoppingItems = [
    ShoppingItem(categoryId: 1, name: 'Oranges', quantity: '10', note: 'hi'),
    ShoppingItem(categoryId: 1, name: 'Apples', quantity: '65', note: 'now'),
    ShoppingItem(categoryId: 1, name: 'Bananas', quantity: '65', note: 'now'),
  ];

  CategroryScreen({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemName,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // todo add a category

        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: shoppingItems.length,
            itemBuilder: (context, index) {
              return ItemCard(item: shoppingItems[index],);
            },
          )),
    );
  }
}