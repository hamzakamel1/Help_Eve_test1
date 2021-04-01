import 'package:flutter/material.dart';

var background = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xff26a69a),
      Color(0xff00897b),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0, 1],
  ),
);

var radiusRoundedRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(paddingBig),
);
var borderRoundedRectangle = RoundedRectangleBorder(
  side: BorderSide(color: Colors.grey.shade600, width: 2),
  borderRadius: BorderRadius.circular(18),
);

var cardRoundedSmile = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(marginMin),
);

var cardRounded = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(22),
);
var cardRoundedZero = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
);
var cardRoundedTop = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);
var cardRoundedBottom = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(20.0),
    bottomRight: Radius.circular(20.0),
  ),
);

final roundBorderRadius = BorderRadius.circular(4);


final textFiledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(marginMin),
  borderSide: new BorderSide(),
);

final buttonCircularBorder = RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(30.0),
);

const double marginMin = 8;
const double paddingBig = 16;
const double elevation = 16;
const double elevationSmall = 8;
const double elevationBigSmall = 4;



