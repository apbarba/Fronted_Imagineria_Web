import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:flutter_bloc_authentication/rest/rest.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

const _postLimit = 10;

class ObrasRepository {
  
late  RestClient _client;

  ObrasRepository(){

    _client = getIt<RestClient>();
  }

  Future<ObrasModel> getAllObras() async {

    String url = '/obras';

    print('Se alcanza');

    var jsonResponse = await _client.get(url);

    return ObrasModel.fromJson(jsonDecode(jsonResponse));
  }
}