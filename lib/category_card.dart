import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/screens/category_screen.dart';

import 'screens/edit_category_screen.dart';

class CategoryCard extends StatelessWidget {
  ShoppingCategory category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategroryScreen(category: category,)));
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Text(
                    category.priority.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  category.name,
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
                  return EditCategoryCard(category: category,);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
