import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/screens/add_category_sheet.dart';
import 'package:flutter_shopping_list/widgets/edit_shopping_list_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  // List<ShoppingCategory> categories = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, shoppingData, child) {
        List<ShoppingCategory> categories = shoppingData.categories;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shopping List',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddCategorySheet();
                  });
            },
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                      itemName: categories[index].name,
                      itemPriority: categories[index].priority);
                },
              )),
        );
      },
    );
  }
}
