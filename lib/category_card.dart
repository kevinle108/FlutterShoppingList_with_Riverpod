import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/screens/category_screen.dart';

import 'widgets/edit_shopping_list_card.dart';

class CategoryCard extends StatelessWidget {
  String itemName;
  int itemPriority;

  CategoryCard({required this.itemName, required this.itemPriority});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategroryScreen(categoryName: itemName,)));
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Text(
                    itemPriority.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black54,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return EditListCard(categoryName: itemName, categoryPriority: itemPriority,);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
