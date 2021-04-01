import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:help_eve/models/note_model.dart';

class Api {
  Future<List<Users>> fetchData() async {
    String data;
    List<Users> users = [];
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = response.body;
      var jsondata = json.decode(data);

      jsondata.map((user) => users.add(Users.fromJson(user))).toList();
      print(users.first.name);
      return users;
    } else {
      return null;
    }
  }
}
