import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:server_status_demo/serverModel.dart';

class ApiService extends ChangeNotifier {
  String? status;
  String? message;

  Future<ServerConnectionModel?> getServer() async {
    final http.Response response = await http.get(
        Uri.parse("https://test-atre-server-v2.up.railway.app/server"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-agent': 'Atre Application'
        });
    final data = serverConnectionModelFromJson(response.body);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      status = data.status;
      message = data.message;
      notifyListeners();
      return serverConnectionModelFromJson(response.body);
    } else {
      return serverConnectionModelFromJson(response.body);
    }
  }
}
