import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import 'obras_details.dart';
import 'package:http/http.dart' as http;

class ObrasPage extends StatelessWidget {
  final User user;

  // dynamic _data;

  const ObrasPage({super.key, required this.user});

  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/obras/'), headers: {
      'Authorization': //modo agitanado
          'Bearer ${user.accessToken}'
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ObraDetailsPage(
                                obraId: (data[index]['id']),
                              )),
                    );
                  },
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
