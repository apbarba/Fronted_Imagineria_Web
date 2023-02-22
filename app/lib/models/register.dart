import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterResponse {
  String? id;
  String? username;
  String? email;
  String? name;
  DateTime? createdAt;
  String? token;
  String? refreshToken;

  RegisterResponse(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.createdAt,
      this.token,
      this.refreshToken});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    createdAt = DateTime.tryParse(json['createdAt']);
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  reformat(String dateTime) {
    String day = dateTime.substring(0, 2);
    String month = dateTime.substring(3, 5);
    String year = dateTime.substring(6, 10);
    String rest = dateTime.substring(11);
    String newString = year + '_' + month + '_' + day + '' + rest;
    print(newString);

    return newString;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['name'] = name;
    data['createdAt'] = createdAt.toString();
    data['token'] = token;
    data['refreshToken'] = refreshToken;

    return data;
  }
}

class RegisterRequest {
  String? username;
  String? password;
  String? verifyPassword;
  String? email;
  String? name;

  RegisterRequest(
      {this.username,
      this.password,
      this.verifyPassword,
      this.email,
      this.name});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    verifyPassword = json['verifyPassword'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['username'] = username;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['verifyPassword'] = verifyPassword;

    return data;
  }
}
