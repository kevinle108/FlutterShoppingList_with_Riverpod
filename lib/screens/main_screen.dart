import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/screens/edit_shopping_list_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return EditListCard();
            },
          );
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
