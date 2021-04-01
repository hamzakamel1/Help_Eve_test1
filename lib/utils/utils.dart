import 'package:flutter/material.dart';
import 'package:hatilaqi/modle/data_list.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/utils/dropdown.dart' as Dropdown;

Color getTextColor(Color color) {
  int d = 0;
// Counting the perceptive luminance - human eye favors green color...
  double luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
  if (luminance > 0.5)
    d = 0; // bright colors - black font
  else
    d = 255; // dark colors - white font
  return Color.fromARGB(color.alpha, d, d, d);
}

// bool phoneNumberValidator(String value) {
//   Pattern pattern = r'(^[0-9]{5,20}$)';
//   RegExp regex = new RegExp(pattern);
//   if (!regex.hasMatch(value))
//     return false;
//   else
//     return true;
// }



List<Dropdown.DropdownMenuItem<DataList>> getListItemSpinnerGender(
    DataList defaultValue, List<DataList> listItem) {
  return listItem.map<Dropdown.DropdownMenuItem<DataList>>((DataList value) {
    return Dropdown.DropdownMenuItem<DataList>(
      value: value,
      child: Container(
        padding: EdgeInsets.all(marginMin),
        margin: EdgeInsets.zero,
//          width: MediaQuery.of(context).size.width * 0.2 ,
        child: Row(
          children: <Widget>[
            Image.asset(
              value.id == 1
                  ? 'assets/images/male.png'
                  : 'assets/images/female.png',
              width: 20,
              height: 30,
            ),
            SizedBox(width: marginMin),
            Text(
              value.name,
              style: TextStyle(
                  color: (defaultValue != null && defaultValue.id == value.id)
                      ? Colors.teal
                      : Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
