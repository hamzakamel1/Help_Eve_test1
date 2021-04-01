import 'package:flutter/material.dart';

Widget note(String index) {
  return Container(
      height: 100.0,
      width: 80,
      child: Card(
        elevation: 2,
        child: Text(index),
      ));
}
