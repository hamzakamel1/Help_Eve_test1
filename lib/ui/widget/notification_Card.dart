import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class NotificationsCardWidget extends StatelessWidget {
  var itemKey;
  NotificationsCardWidget({@required this.itemKey});
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    
    return Dismissible(
       key: Key(itemKey),
       onDismissed: (k){},
       direction: DismissDirection.horizontal,

          child: Container(
        height: _height*0.12,
        child:Card(child:ListTile(
          leading:Icon(Icons.notifications,),
          title:Text(tr('have_an_order_to_you')) ,
          subtitle: Text("2020-12-20 | 8:20"),
        ) ,) ,
      ),
    );
  }
}