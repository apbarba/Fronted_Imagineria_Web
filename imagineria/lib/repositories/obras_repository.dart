import 'dart:convert';
import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:http/http.dart';

class ObrasRepositoy{

  String endpoint = 'http://localhost:8080/obras/';

  Future<List<ObrasModel>> getObras() async {

    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200){

      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => ObrasModel.fromJson(e))).toList();
    }else{

      throw Exception(response.reasonPhrase);
    }
  }
}