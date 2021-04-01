import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hatilaqi/ui/notifications/notifications_screen.dart';
import 'package:hatilaqi/ui/widget/LastestOrder_card.dart';
import 'package:hatilaqi/ui/widget/drawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: DrawerW(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: _height * 0.6,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      new Container(
                        width: _width,
                        height: _height * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                            color: Theme.of(context).primaryColor),
                        child: Column(
                          children: [
                            SizedBox(
                              height: _height * 0.1,
                            ),
                            ClipOval(
                              child: CircleAvatar(
                                radius: _height*0.08,
                                child: Image.asset('assets/images/profile.jpg'),
                              ),
                            ),
                            Text(
                              "Ahmed Gamal",
                              style:  Theme.of(context).textTheme.bodyText2
                            ),
                            Text(
                              "Villa Driver " + "4722",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          width: _width,
                          height: _height * 0.2,
                          child: Column(
                            children: [
                              ListTile(
                                subtitle: Expanded(
                                    child: Container(
                                        width: _width,
                                        child: Text("Short Bio about driver"))),
                                title: new Text(
                                  tr('about'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: _height * 0.025,
                                      color: Colors.teal),
                                ),
                                leading: Icon(
                                  Icons.person,
                                  color:
                                      Theme.of(context).accentIconTheme.color,
                                  size: _height * 0.04,
                                ),
                              ),
                              ListTile(
                                title: new Text(
                                  tr('recent_orders'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: _height * 0.025,
                                      color: Colors.teal),
                                ),
                                leading: Icon(
                                  Icons.shopping_basket_outlined,
                                  color:
                                      Theme.of(context).accentIconTheme.color,
                                  size: _height * 0.04,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              elevation: 0,
              title: Text(tr('profile')),
              centerTitle: true,
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
            ),
          SliverList(
      delegate: SliverChildBuilderDelegate(
        
            (BuildContext context, int index) {
          return LastOrder(
            orderNum:index+1 ,
          );
        },
        childCount: 10,
      ),
    )
          ],
        ));
  }
}
