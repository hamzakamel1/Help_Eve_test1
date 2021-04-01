import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/ui/help_widget.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(paddingBig),
              child: Image.asset(
                'assets/images/logo_icon.png',
                width: 90,
                height: 90,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(
                      vertical: paddingBig,
                    ),
                    child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Container(
                          height: 45,
                          child: new Text(
                            tr('login'),
                            maxLines: 1,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Container(
                          height: 45,
                          child: new Text(
                            tr('signUp'),
                            maxLines: 1,
                            style: TextStyle(fontSize: 13),
                          ),
                        )
                      ],
                      unselectedLabelColor: const Color(0xffacb3bf),
                      indicatorColor: Color(0xFFffac81),
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      indicatorPadding: EdgeInsets.all(10),
                      isScrollable: false,
                      controller: _tabController,
                    ),
                  ),
                  Container(
                    height: double.maxFinite,
                    child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          // LoginScreen(),
                          // SignUpScreen(),
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
