import 'dart:convert';

import 'package:flutter_bloc_authentication/models/login.dart';
import 'package:flutter_bloc_authentication/models/register.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_bloc_authentication/rest/rest.dart';

@Order(-1)
@singleton
class AuthenticationRepository {
  late RestClient _client;

  AuthenticationRepository() {
    _client = GetIt.I.get<RestClient>();
    //_client = RestClient();
  }

  Future<dynamic> doLogin(String username, String password) async {
    String url = "/auth/login";

    var jsonResponse = await _client.post(
        url, LoginRequest(username: username, password: password));
    return LoginResponse.fromJson(jsonDecode(jsonResponse));
  }

  Future<dynamic> doRegister(String username, String password,
      String verifyPassword, String email, String name) async {
    String url = '/auth/register';

    print('doRegister: ' + username);

    print('Request: ' +
        RegisterRequest(
                username: username,
                password: password,
                verifyPassword: verifyPassword,
                email: email,
                name: name)
            .username!);

    var jsonResponse = await _client.post(
        url,
        RegisterRequest(
            username: username,
            password: password,
            verifyPassword: verifyPassword,
            email: email,
            name: name));

    print(RegisterResponse.fromJson(jsonDecode(jsonResponse)));

    return RegisterResponse.fromJson(jsonDecode(jsonResponse));
  }
}
