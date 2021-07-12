import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_data.dart';
import 'package:provider/provider.dart';

class AddCategorySheet extends StatefulWidget {
  @override
  State<AddCategorySheet> createState() => _AddCategorySheetState();
}

class _AddCategorySheetState extends State<AddCategorySheet> {
  String newCategory = '';
  String newPriority = '';

  void addCategoryAndReturn(BuildContext context, String newCategory, String newPriority) {
    if (int.tryParse(newPriority) != null) {
      Provider.of<ShoppingData>(context, listen: false).addCategory(newCategory, int.parse(newPriority), 99);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Category Name',
            ),
            onChanged: (value) {
              newCategory = value;
            },
            onSubmitted: (value) => addCategoryAndReturn(context, newCategory, newPriority)
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Category Priority',
            ),
            onChanged: (value) {
              newPriority = value;
            },
            onSubmitted: (value) => addCategoryAndReturn(context, newCategory, newPriority),
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
            onPressed: () => addCategoryAndReturn(context, newCategory, newPriority),
            child: Text(
              'Add Category',
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
