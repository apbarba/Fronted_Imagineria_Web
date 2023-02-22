import 'dart:convert';

import 'package:flutter_bloc_authentication/models/user.dart';
import 'package:http/http.dart' as http;

class ObrasRepository {
  late final User user;

  Future<http.Response> addObras(
      String nameController,
      String precioController,
      String tituloController,
      String imgController,
      String estadoController,
      DateTime fechaController,
      String estiloController) async {
    var url = Uri.parse('http://localhost:8080/obras');

    Map data = {
      'name': '$nameController',
      'precio': '$precioController',
      'titulo': '$tituloController',
      'img': '$imgController',
      'estado': '$estadoController',
      'fecha': '$fechaController',
      'estilo': '$estiloController'
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer ${user.token}', body: body});

    print("${response.statusCode}");
    print("${response.body}");

    return response;
  }
}
