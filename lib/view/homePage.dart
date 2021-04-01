import 'package:flutter/material.dart';
import 'package:help_eve/models/note_model.dart';
import 'package:help_eve/view/newnote.dart';
import 'package:help_eve/view/note_widget.dart';
import 'package:help_eve/controllers/api.dart';

Api api = Api();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            //  var usersList = await
            List<Users> users = await api.fetchData();
            print(users[0].address.suite);
            //  print(usersList.toString());
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext context) {
            //   return AddNewNote();
            // }));
          },
        ),
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text("Rest Api "),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return note(index.toString());
            }));
  }
}
