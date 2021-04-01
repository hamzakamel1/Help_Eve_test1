
import 'package:flutter/animation.dart';

getMyAnimation(AnimationController controller, int type){
  switch(type) {
    case 1 :
      return Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .5,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 2 :
      return Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .2,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 3 :
      return Tween(begin: -1.0, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .9,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 4 :
      return Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .5,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 5 :
      return Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .7,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 6 :
      return Tween(begin: 1.0, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            .9,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      );
      break;
    case 7 :
      return Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.bounceInOut,
        ),
      );
      break;
    case 8 :
      return Tween(begin: 1.0, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.bounceInOut,
        ),
      );
      break;
    case 9 :
      return Tween(begin: -1.0, end: 0).animate(CurvedAnimation(
          parent: controller, curve: Curves.bounceInOut));
      break;
    case 10 :
      return Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(.50, 1.0, curve: Curves.fastOutSlowIn)));
      break;
    case 11 :
      return Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(.8, 1.0, curve: Curves.fastOutSlowIn)));
      break;
  }
}
