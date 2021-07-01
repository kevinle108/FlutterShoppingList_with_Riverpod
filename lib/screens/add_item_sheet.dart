import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';
import 'package:provider/provider.dart';

class AddItemSheet extends StatelessWidget {

  // variables for storing new Item entries
  String newItem = '';
  String newQuantity = '';
  String newNote = '';

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // ShoppingItem myItem = ShoppingItem(categoryId: 1, name: newItem, quantity: newQuantity, note: newNote);
              // myItem.printItem();
              print('inside AddItemSheet onPressed');
              print('newItem: ${newItem}, newQuantity: ${newQuantity}, newNote: ${newNote}');
              Provider.of<ShoppingData>(context, listen: false).addItem(newItem, newQuantity, newNote);
              Navigator.pop(context);
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
// class AddCategorySheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         children: <Widget>[
//           TextField(
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//               hintText: 'Enter Category Name',
//             ),
//           ),
//           TextField(
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//               hintText: 'Enter Category Priority',
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 primary: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(32.0),
//                 )),
//             onPressed: () {},
//             child: Text(
//               'Add Category',
//               style: TextStyle(fontSize: 20.0, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
