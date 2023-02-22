import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import 'addObras_page.dart';
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
          'Bearer ${user.token}'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["content"].toList();
    } else {
      throw Exception('Failed to load Obras');
    }
  }

  _navigateAddObras(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddObrasPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obras'),
        actions: [
          ElevatedButton(
            child: Icon(Icons.add),
            onPressed: () => _navigateAddObras(context),
          ),
        ],
      ),
      body: FutureBuilder<List>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ItemList(
                    list: snapshot.requireData,
                  )
                : Center(
                    child: CircularProgressIndicator(color: Colors.purple),
                  );
          }),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('My Widget')),
//      body: FutureBuilder(
//        future: fetchData(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            List<dynamic> data = snapshot.data as List<dynamic>;
//            return ListView.builder(
//              itemCount: data.length,
//              itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text(data[index]['name']),
//                  subtitle: Text(data[index]['name']),
//                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => ObraDetailsPage(
//                                obraId: (data[index]['id']),
//                              )),
//                    );
//                  },
//                );
//              },
//            );
//          } else if (snapshot.hasError) {
//            return Text("${snapshot.error}");
//          }
//          return CircularProgressIndicator();
//        },
//      ),
//    );
//  }
}

class ItemList extends StatelessWidget {
  final List list;

  const ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100.3,
                  child: Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[i]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[i]['titulo'].toString(),
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
