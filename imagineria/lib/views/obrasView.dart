import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ObrasView extends StatefulWidget {
  @override
  _ObrasListState createState() => _ObrasListState();
}

class _ObrasListState extends State<ObrasView> {
  late List data;

  Future<List> getData() async {
    final response = await http.get(Uri.parse('http://localhost8080/obras/'));

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  const ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ObrasView.builder(
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
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['name'].toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black12),
                                  ),
                                ),
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
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['precio'].toString(),
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['estado'].toString(),
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['estilo'].toString(),
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['fecha'].toString(),
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list[i]['img'].toString(),
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
