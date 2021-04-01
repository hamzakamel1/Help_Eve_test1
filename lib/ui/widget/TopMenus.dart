import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/utils/images.dart';

// class TopMenus extends StatefulWidget {
//   @override
//   _TopMenusState createState() => _TopMenusState();
// }
//
// class _TopMenusState extends State<TopMenus> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.0,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Container(
//           padding: EdgeInsets.only(left: 15.0),
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   dataSearch.hotDeals = 1;
//                   dataSearch.categoryId = null;
//                   _blocSearch.add(
//                     SearchProductFetched(dataSearch: dataSearch),
//                   );
//                   setState(() {
//                     _categoryHotDeals = true;
//                     for (int i = 0; i < categories.length; i++) {
//                       categories[i].isSelected = false;
//                     }
//                   });
//                 },
//                 child: Container(
//                     margin: EdgeInsets.all(8.0),
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                         color:
//                             _categoryHotDeals ? Theme.of(context).primaryColor
//                                 : Colors.white,
//                         borderRadius: new BorderRadius.circular(10.0)),
//                     child: Text(
//                       tr('all') ,
//                       style: TextStyle(
//                         color: category.isSelected
//                             ? Theme.of(context).primaryColor
//                             : Colors.white,
//                       ),
//                     )
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: categories.map((category) {
//                   return InkWell(
//                     onTap: () {
//                       dataSearch.categoryId = category.id;
//                       dataSearch.hotDeals = null;
//                       _blocSearch.add(
//                         SearchProductFetched(dataSearch: dataSearch),
//                       );
//                       setState(() {
//                         _categorySelected = true;
//                         _categoryHotDeals = false;
//                         for (int i = 0; i < categories.length; i++) {
//                           if (categories[i].name == category.name) {
//                             categories[i].isSelected = true;
//                             _selectedCategoryId = categories[i].id;
//                           } else {
//                             categories[i].isSelected = false;
//                           }
//                         }
//                       });
//                     },
//                     child: Container(
//                         margin: EdgeInsets.all(8.0),
//                         padding: EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                             color: category.isSelected
//                                 ? Theme.of(context).primaryColor
//                                 : Colors.white,
//                             borderRadius: new BorderRadius.circular(10.0)),
//                         child: Text(
//                           category.name ?? "",
//                           style: TextStyle(
//                             color: category.isSelected
//                                 ? Theme.of(context).primaryColor
//                                 : Colors.white,
//                           ),
//                         )),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
