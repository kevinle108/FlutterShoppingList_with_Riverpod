import 'package:flutter/material.dart';

class AddCategorySheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Category Name',
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter Category Priority',
            ),
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
            onPressed: () {},
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
