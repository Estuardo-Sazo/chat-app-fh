import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/login_respose.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  User? user;
  bool _authenticating = false;

  bool get authenticating => _authenticating;
  set authenticating(bool value){
    _authenticating = value;
    notifyListeners();
  }
  

  Future<bool> login(String email, String password) async {

    authenticating = true;

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        });

        authenticating = false;

        if(resp.statusCode == 200){
          final loginResponse = loginResponseFromJson(resp.body);
          user = loginResponse.user;

          return true;

        }else{
          return false;
        }



  }
}