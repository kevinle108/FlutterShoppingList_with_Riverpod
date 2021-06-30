import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/category_card.dart';
import 'package:flutter_shopping_list/screens/edit_shopping_list_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return EditListCard();
          //   },
          // );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CategoryCard(itemName: 'Fruit', itemPriority: 1,),
            CategoryCard(itemName: 'Vegetables', itemPriority: 2,),
            CategoryCard(itemName: 'Bakery', itemPriority: 1,),
          ],
        ),
      ),
    );
  }
}
