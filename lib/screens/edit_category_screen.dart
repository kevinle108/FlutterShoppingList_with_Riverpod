import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:provider/provider.dart';

class EditCategoryCard extends StatelessWidget {
  String categoryName;
  int categoryPriority;

  String newName = '';
  String newPriority = '';

  // int categoryId?

  EditCategoryCard({required this.categoryName, required this.categoryPriority});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      title: Text(
        'Edit Shopping List',
      ),
      children: [
        TextField(
          controller: TextEditingController(text: categoryName),
          onChanged: (value) {
            newName = value;
          },
        ),
        TextField(
          controller: TextEditingController(text: categoryPriority.toString()),
          onChanged: (value) {
            newPriority = value;
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              )),
          onPressed: () {
            Provider.of<ShoppingData>(context, listen: false).editCategory(categoryName, newName, newPriority);
            Navigator.pop(context);
          },
          child: Text(
            'Save Shopping List',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
