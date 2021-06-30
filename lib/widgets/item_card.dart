import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_item.dart';

class ItemCard extends StatelessWidget {
  ShoppingItem item;

  ItemCard({required this.item});

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
                      item.name,
                      style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                      'Quantity: ${item.quantity} - Note: ${item.note}',
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
