import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:provider/provider.dart';

class EditCategoryCard extends StatefulWidget {
  ShoppingCategory category;
  
  EditCategoryCard({required this.category});

  @override
  State<EditCategoryCard> createState() => _EditCategoryCardState();
}

class _EditCategoryCardState extends State<EditCategoryCard> {
  String newName = '';
  String newPriority = '';

  @override
  Widget build(BuildContext context) {
    newName = widget.category.name;
    newPriority = widget.category.priority.toString();

    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      title: Text(
        'Edit Shopping List',
      ),
      children: [
        TextField(
          autofocus: true,
          controller: TextEditingController(text: widget.category.name),
          onChanged: (value) {
            newName = value;
          },
        ),
        TextField(
          controller: TextEditingController(text: widget.category.priority.toString()),
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
            if (widget.category.name != newName || widget.category.priority.toString() != newPriority) {
              if (int.tryParse(newPriority) != null) {
                // create new ShoppingCategory obj
                ShoppingCategory modifiedCategory = ShoppingCategory(name: newName, priority: int.parse(newPriority), id: widget.category.id);
                Provider.of<ShoppingData>(context, listen: false).editCategory(modifiedCategory);
                Navigator.pop(context);
              }
            }
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
