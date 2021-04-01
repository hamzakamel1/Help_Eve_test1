import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/ui/home/home_screen.dart';
import 'package:hatilaqi/ui/widget/historyWidget.dart';

class DrawerW extends StatefulWidget {
  @override
  _DrawerWState createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180.0,
            color: Colors.grey[300],
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                ClipOval(
                  child: CircleAvatar(
                    radius: 38,
                    child: Image.asset('assets/images/profile.jpg'),
                  ),
                ),
                Text(
                  "Ahmed Gamal",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text("ahmed@gmail.com")
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: new ListTile(
                  leading: Icon(Icons.shopping_basket),
                  title: Text(
                    tr('orders'),
                  ))),
          new ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                tr('notifications'),
              )),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: new ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  tr('orders_history'),
                )),
          ),
          Divider(),
          new ListTile(
              leading: Icon(Icons.language),
              title: Text(
                tr('language'),
              )),
          new ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                tr('logout'),
              )),
        ],
      ),
    );
  }
}
