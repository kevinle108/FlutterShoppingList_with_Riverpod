import 'package:flutter/material.dart';

class EditListCard extends StatelessWidget {
  String categoryName;
  int categoryPriority;

  EditListCard({required this.categoryName, required this.categoryPriority});

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
        ),
        TextField(
          controller: TextEditingController(text: categoryPriority.toString()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              )),
          onPressed: () {},
          child: Text(
            'Save Shopping List',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
