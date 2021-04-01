import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/ui/notifications/notifications_screen.dart';
import 'package:hatilaqi/ui/widget/drawer.dart';
class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return  
        Scaffold (
          drawer: DrawerW(),
          appBar: AppBar(
        elevation: 0,
        backgroundColor:  
             Theme.of(context).primaryColor,
            
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                //  vertical:20.0,
                horizontal: 25.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Notifications();
                  }));
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 25.0,
                )),
          )
        ],
        centerTitle: true,
        title: Text(tr('orders_history')),
      ),
              body: Container(
          child: Center(
            child: Text("data3"),
          ),
        ),
      );
  }
}