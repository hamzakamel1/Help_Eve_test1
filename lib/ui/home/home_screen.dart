import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hatilaqi/bloc/authentication/authentication_bloc.dart';
import 'package:hatilaqi/ui/notifications/notifications_screen.dart';
import 'package:hatilaqi/ui/widget/ProfileWidget.dart';
import 'package:hatilaqi/ui/widget/drawer.dart';
import 'package:hatilaqi/ui/widget/historyWidget.dart';
import 'package:hatilaqi/ui/widget/homeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 1;
  // var _navigateToScreens;
  // List<String> _screenTitle;

  AuthenticationBloc _authenticationBloc;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    // _navigateToScreens = [
    //   Center(
    //     child: Text(tr('One')),
    //   ),
    //   Center(
    //     child: Text(tr('two')),
    //   ),
    //   Center(
    //     child: Text(tr('three')),
    //   ),
    //   Center(
    //     child: Text(tr('four')),
    //   ),
    // ];

    //   _screenTitle = [
    //     tr('home'),
    //     tr('two'),
    //     tr('three'),
    //     tr('four'),
    //   ];
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
       
   //   drawer: DrawerW(),
      body: index == 0 ? Profile() : index == 1 ? Home() : History(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 5,
        currentIndex: index,
        onTap: (indexSelect) {
          setState(() {
            index = indexSelect;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: index == 0 ? 34 : 25,
            ),
            title: Text(tr('')),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 27,
                child: Icon(
                  Icons.home,
                  size: index == 1 ? 34 : 25,
                )),
            title: Text(tr('')),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: index == 2 ? 34 : 25,
            ),
            title: Text(tr('')),
          ),
        ],
      ),
    );
  }
}
