import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:flutter_shopping_list/screens/add_item_sheet.dart';
import 'package:flutter_shopping_list/widgets/edit_shopping_list_card.dart';
import 'package:flutter_shopping_list/widgets/item_card.dart';

class CategroryScreen extends StatelessWidget {
  String itemName;

  List<ShoppingItem> shoppingItems = [];

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
          // todo add an item
          print('clicked add item!');
          showModalBottomSheet(context: context, builder: (context) {
            return AddItemSheet();
          });
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
