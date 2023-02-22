import 'dart:convert';
import 'dart:ffi';
//import 'dart:developer';

import 'package:flutter_bloc_authentication/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

//import '../exceptions/exceptions.dart';
import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:flutter_bloc_authentication/repositories/repositories.dart';

import '../models/register.dart';

abstract class AuthenticationService {
  Future<User?> getCurrentUser();
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> register(String username, String password,
      String verifyPassword, String email, String name);
}

/*
class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<User?> getCurrentUser() async {
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      throw AuthenticationException(message: 'Wrong username or password');
    }
    return User(name: 'Test User', email: email);
  }

  @override
  Future<void> signOut() async {
    log("logout");
  }
}
*/

@Order(2)
//@Singleton(as: AuthenticationService)
@singleton
class JwtAuthenticationService extends AuthenticationService {
  late AuthenticationRepository _authenticationRepository;
  late LocalStorageService _localStorageService;

  JwtAuthenticationService() {
    _authenticationRepository = GetIt.I.get<AuthenticationRepository>();
    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  @override
  Future<User?> getCurrentUser() async {
    String? loggedUser = _localStorageService.getFromDisk("user");
    if (loggedUser != null) {
      var user = LoginResponse.fromJson(jsonDecode(loggedUser));
      return User(
          email: user.username ?? "",
          name: user.fullName ?? "",
          token: user.token ?? "");
    }
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    LoginResponse response =
        await _authenticationRepository.doLogin(email, password);
    await _localStorageService.saveToDisk(
        'user', jsonEncode(response.toJson()));
    return User(
        email: response.username ?? "",
        name: response.fullName ?? "",
        token: response.token ?? "");
  }

  @override
  Future<void> signOut() async {
    await _localStorageService.deleteFromDisk("user");
  }

  @override
  Future<User> register(String username, String password, String verifyPassword,
      String email, String name) async {
    print('register: ' + username);

    RegisterResponse response = await _authenticationRepository.doRegister(
        username = username,
        password = password,
        verifyPassword = verifyPassword,
        email = email,
        name = name);

    await _localStorageService.saveToDisk(
        'user', jsonEncode(response.toJson()));

    return User(
        name: response.name ?? '',
        email: response.username ?? '',
        token: response.token ?? '');
  }
}
