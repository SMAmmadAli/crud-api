import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_api/Model/user_model.dart';

getUser() async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var uri = Uri.parse(url);
  var response = await http.get(uri);
  var responseData = jsonDecode(response.body);
  var userData = UserModel.fromJson(responseData);
  return userData;
}

deleteUser(id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var uri = Uri.parse(url);
  var response = await http.delete(uri);
  print(response.body);
}

addUser(data) async {
  var url = "https://maaz-api.tga-edu.com/api/users";
  var uri = Uri.parse(url);
  var response = await http.post(uri,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
}

updateUser(
    {required int id,
    required String name,
    required String userName,
    required String email}) async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  Uri uri = Uri.parse(url);
  http.Response response = await http.put(uri,
      headers: {'content-type': 'application/json'},
      body: jsonEncode({"name": name, "username": userName, "email": email}));
  Map<String, dynamic> body = jsonDecode(response.body);
  return body;
}
