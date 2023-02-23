import 'dart:convert';

import 'package:flutter_bloc_authentication/models/user.dart';
import 'package:flutter_bloc_authentication/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../models/obras.dart';

class ObrasRepository {
  late User user;
  late RestClient _client;

  ObrasRepository() {
    _client = GetIt.I.get<RestClient>();
  }

  void init(User newUser) {
    user = newUser;
  }

  Future<dynamic> addObras(ObrasRequest obra) async {
    var url = '/obras/';
    var body = obra.toJson();

    var response = await _client.post(url, body);

    return response;
  }

  Future<dynamic> addObras1(
    String name,
    String precio,
    String titulo,
    String img,
    String estado,
    String fecha,
    String estilo,
  ) async {
    String url = '/obras/';

    var jsonResponse = await _client.post(
        url,
        ObrasRequest(
            name: name,
            precio: precio,
            titulo: titulo,
            img: img,
            estado: estado,
            estilo: estilo));

    print(ObrasRequest.fromJson(jsonDecode(jsonResponse)));

    return ObrasRequest.fromJson(jsonDecode(jsonResponse));
  }
}
