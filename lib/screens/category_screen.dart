import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:flutter_shopping_list/screens/add_item_sheet.dart';
import 'package:flutter_shopping_list/widgets/edit_shopping_list_card.dart';
import 'package:flutter_shopping_list/widgets/item_card.dart';
import 'package:provider/provider.dart';

class CategroryScreen extends StatelessWidget {
  String categoryName;



  // todo implement categoryId to link back to parent list
  // int categoryId;

  CategroryScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, shoppingData, child) {
        List<ShoppingItem> items = shoppingData.items;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              categoryName,
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index],);
                },
              )),
        );
      },
    );
  }
}
