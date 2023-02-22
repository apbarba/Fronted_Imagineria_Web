import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import '../models/models.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final User user;

  // dynamic _data;

  const HomePage({super.key, required this.user});

  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/obras/'), headers: {
      'Authorization': //modo agitanado
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhYzFiMDM2ZC04Njc4LTE5MGUtODE4Ni03ODI5MTU4NTAwMDAiLCJpYXQiOjE2NzcwNTMyMjUsImV4cCI6MTE1NTc4NDM1NjV9.zCjWjtmqIKis2sIWcgl7HCXMLefOtoattyTJ9t-ozG6x4gfpsFnYfMmrWaGR-xgrmSGK8JPmO5z5tbdWyMtYAQ'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["content"].toList();
    } else {
      throw Exception('Failed to load Obras');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Widget')),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name']),
                  subtitle: Text(data[index]['titulo']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
