import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/ui/widget/drawer.dart';
import 'package:hatilaqi/ui/widget/notification_Card.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawerW(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        centerTitle: true,
        title: Text(tr('notifications')),
      ),
      body: Column(
        children: [
          Container(
            child:ListTile(
              subtitle: Text(tr('swipe'),style: TextStyle(
                fontSize: _height*0.021
              )),
              leading: Icon(Icons.notifications,
              size: _height*0.05,
              color: Colors.teal[200],),
              title:Text(tr('notifications'),style: TextStyle(fontWeight: FontWeight.bold),) ,
            ) ,
            height: _height * 0.1,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            height: _height - _height * 0.1 - _height * 0.01 - _height * 0.12,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return NotificationsCardWidget(
                    // add items here....
                  );
                }),
          )
        ],
      ),
    );
  }
}
