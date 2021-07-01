import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_category.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:provider/provider.dart';

class EditItemCard extends StatefulWidget {
  ShoppingItem item;
  
  EditItemCard({required this.item});

  @override
  State<EditItemCard> createState() => _EditItemCardState();
}

class _EditItemCardState extends State<EditItemCard> {
  String newName = '';
  String newQuantity = '';
  String newNote = '';

  @override
  Widget build(BuildContext context) {
    newName = widget.item.name;
    newQuantity = widget.item.quantity;
    newNote = widget.item.note;

    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      title: Text(
        'Edit ${widget.item.name} List',
      ),
      children: [
        TextField(
          autofocus: true,
          controller: TextEditingController(text: widget.item.name),
          onChanged: (value) {
            newName = value;
          },
        ),
        TextField(
          controller: TextEditingController(text: widget.item.quantity),
          onChanged: (value) {
            newQuantity = value;
          },
        ),
        TextField(
          controller: TextEditingController(text: widget.item.note),
          onChanged: (value) {
            newNote = value;
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              )),
          onPressed: () {
            print('local textFields values:');
            print(newName);
            print(newQuantity);
            print(newNote);
            if (newName != widget.item.name || newQuantity != widget.item.quantity || newNote != widget.item.note) {
              Provider.of<ShoppingData>(context, listen: false).editItem(widget.item.id, newName, newQuantity, newNote);
              Navigator.pop(context);
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
