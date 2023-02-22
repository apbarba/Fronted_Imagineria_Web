import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class ObraDetailsPage extends StatelessWidget {
  final String obraId;

  ObraDetailsPage({required this.obraId}) : super();

  Future<Map<String, dynamic>> fetchObraDetails() async {
    final User user;
    final response = await http
        .get(Uri.parse('http://localhost:8080/obras/${obraId}'), headers: {
      'Authorization':
          'Bearer eyJzdWIiOiJhYzFiMDM2ZC04Njc4LTE5MGUtODE4Ni03ODI5MTU4NTAwMDAiLCJpYXQiOjE2NzcwNTYyMzksImV4cCI6MTE1NTc4NDY1Nzl9.osNsOLUn7GpdvUNXnQv9wDFmPVptt6FivMWywc8mEfZyTxun0kyaCl1aEtcBmklDAHnAn-FdFBudsiqM35LInQ'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["content"].toList();
    } else {
      throw Exception('Failed to load Obras');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchObraDetails(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Detalles del producto'),
              ),
              body: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${snapshot.data?['titulo']}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Nombre:  ${snapshot.data?['name']}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Precio:  ${snapshot.data?['precio']}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Estado:  ${snapshot.data?['estado']}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Fecha:  ${snapshot.data?['fecha']}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
            //return Text('Title: ${snapshot.data?['titulo']}');
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
