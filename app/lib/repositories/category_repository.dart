import 'dart:convert';

import 'package:flutter_bloc_authentication/models/categoria.dart';
import 'package:flutter_bloc_authentication/rest/rest_client.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
@Order(-1)
@singleton
class CategoryRepository {
  final box = GetStorage();
  late RestClient _client;
  CategoryRepository() {
    _client = GetIt.I.get<RestClient>();
  }

  Future<CategoriaResponse> fetchAllCategory() async {
    String url = '/categoria/';

    Map<String, String> headers = {
      'Authorization': 'Bearer ${box.read('token')}'
    };
     var respuesta = await _client.get(url, headers: headers);
    return CategoriaResponse.fromJson(jsonDecode(respuesta));
  }
}
