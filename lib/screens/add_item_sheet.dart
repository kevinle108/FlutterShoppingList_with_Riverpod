import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:provider/provider.dart';

class AddItemSheet extends StatelessWidget {

  // variables for storing new Item entries
  String newItem = '';
  String newQuantity = '';
  String newNote = '';

  void addItemAndReturn(BuildContext context) {
    Provider.of<ShoppingData>(context, listen: false).addItem(newItem, newQuantity, newNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Item Name',
            ),
            onChanged: (value) {
              newItem = value;
              print(newItem);
            },
            onSubmitted: (value) {
              addItemAndReturn(context);
            },
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Item Quantity',
            ),
            onChanged: (value) {
              newQuantity = value;
              print(newQuantity);
            },
            onSubmitted: (value) {
             addItemAndReturn(context);
            },
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Item Note',
            ),
            onChanged: (value) {
              newNote = value;
              print(newNote);
            },
            onSubmitted: (value) {
              addItemAndReturn(context);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                )),
            onPressed: () {
              print('inside AddItemSheet onPressed');
              print('newItem: ${this.newItem}, newQuantity: ${this.newQuantity}, newNote: ${this.newNote}');
              addItemAndReturn(context);
            },
            child: Text(
              'Add Item',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}