// import 'package:flutter/material.dart';
//
// Widget genderBox(BuildContext context, Color color, String text, String img) {
//   return Container(
//     height: 100,
//     width: MediaQuery.of(context).size.width * 0.42,
//     decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 10,
//           )
//         ]),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Image.asset(
//           img,
//           width: 70,
//           height: 70,
//         ),
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             color: color == Color(0xFF36BA7A) ? Colors.white : Colors.black,
//           ),
//         ),
//       ],
//     ),
//   );
// }