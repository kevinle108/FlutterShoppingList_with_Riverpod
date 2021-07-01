import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:flutter_shopping_list/screens/add_item_sheet.dart';
import 'package:flutter_shopping_list/screens/edit_category_screen.dart';
import 'package:flutter_shopping_list/widgets/item_card.dart';
import 'package:provider/provider.dart';

class CategroryScreen extends StatelessWidget {
  ShoppingCategory category;

  // todo implement categoryId to link back to parent list
  // int categoryId;

  CategroryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, shoppingData, child) {
        int catId = category.id;
        List<ShoppingItem> items = shoppingData.items.where((item) => item.categoryId == catId).toList();
        // List<ShoppingItem> items = [];
        // for (int i = 0; i < shoppingData.items.length; i++) {
        //   print(shoppingData.items[i].id);
        //   if (shoppingData.items[i].categoryId == catId) items.add(shoppingData.items[i]);
        // }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              category.name,
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // todo add an item
              print('clicked add item!');
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return AddItemSheet(categoryId: category.id,);
                  });
            },
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    item: items[index],
                  );
                },
              )),
        );
      },
    );
  }
}
