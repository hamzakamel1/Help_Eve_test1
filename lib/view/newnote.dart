import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  @override
  _AddNewNoteState createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  TextEditingController titleController = new TextEditingController();
  TextEditingController contentController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Note"),
        ),
        body: Form(
          key: _globalKey,
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              textfield(
                  title: "title", controller: titleController, text: "title"),
              SizedBox(
                height: 20.0,
              ),
              textfield(
                  title: "Content",
                  controller: contentController,
                  text: "content"),
              SizedBox(
                height: 50.0,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: FlatButton(
                    color: Colors.teal,
                    onPressed: () {
                      if (_globalKey.currentState.validate()) {
                        print("validate");
                      }
                    },
                    child: Text("Add")),
              )
            ],
          ),
        ));
  }
}

Widget textfield(
    {String title, TextEditingController controller, String text}) {
  return Center(
    child: Container(
      height: 50.0,
      width: 350,
      child: TextFormField(
        validator: (val) {
          if (val.isEmpty) return "Please Enter $text";
        },
        controller: controller,
        decoration: InputDecoration(labelText: title),
      ),
    ),
  );
}
