import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../config/locator.dart';
import '../models/obras.dart';
import '../rest/rest_client.dart';

class ObrasRepository {
  late RestClient _client;

  ObrasRepository() {
    _client = GetIt.I.get<RestClient>();
  }

  Future<ObrasModel> findAllObras() async {
    String url = "/obras/";

    var jsonResponse = await _client.get(url);

    return ObrasModel.fromJson(jsonDecode(jsonResponse));
  }
}
