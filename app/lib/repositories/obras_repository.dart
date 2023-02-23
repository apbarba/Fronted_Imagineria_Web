import 'dart:convert';

import 'package:flutter_bloc_authentication/models/user.dart';
import 'package:flutter_bloc_authentication/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../models/obras.dart';

class ObrasRepository {
  User? user;
  late RestClient _client;

  ObrasRepository() {
    _client = GetIt.I.get<RestClient>();
  }

  void init(User newUser) {
    user = newUser;
  }

  Future<dynamic> addObras(Obras obra) async {
    var url = '/obras';
    var body = obra.toJson();

    var response = await _client.post(url, body);

    print("${response.statusCode}");
    print("${response.body}");

    return response;
  }
}
