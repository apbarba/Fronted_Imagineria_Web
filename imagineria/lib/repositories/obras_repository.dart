import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

const _postLimit = 10;

@singleton
class ObrasRepository {
  final httpClient = http.Client();

  Future<List<ObrasModel>> fetchObras([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        '/obras/',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'}
            as String,
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return List<ObrasModel>.from(body.map((e) => ObrasModel.fromJson(e)));
    }

    throw Exception("Error al cargar las listas");
  }
}

class NetworkError extends Error {}
