import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  String itemName;
  int itemQuantity;
  String itemNote;

  ItemCard({required this.itemName, required this.itemNote, required this.itemQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      itemName,
                      style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                      'Quantity: $itemQuantity - Note: $itemNote',
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                  ),
                ],
            ),
            IconButton(
              icon: Icon(Icons.edit, size: 30.0,),
              onPressed: () {
              },
            ),
          ],
      )
    );
  }
}
