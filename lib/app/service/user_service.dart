import 'dart:convert';

import 'package:app1/app/data/constant/api_string.dart';
import 'package:app1/app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getUserList() async {
  List<User> usersList = [];
  try {
    var url = Uri.parse(ApiString.USER_API);
    var header = {
      "Accept": 'application/json',
      "app-id": '616916589d66eecb13c7a848',
    };
    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      var userJson = json.decode(response.body)['data'];
      for (var item in userJson) {
        usersList.add(User.fromJson(item));
      }
    }
  } catch (e) {
    //
  }

  return usersList;
}
