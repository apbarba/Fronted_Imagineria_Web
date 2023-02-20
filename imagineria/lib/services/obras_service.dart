

import 'dart:convert';

import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:flutter_bloc_authentication/repositories/repositories.dart';
import 'package:flutter_bloc_authentication/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class ObrasService{

  Future<User?> getCurrentUser();

  Future<List<ObrasModel>> getAllObras();
}

@Order(1)

@singleton
class JwtObrasService extends ObrasService {

  late ObrasRepository _obrasRepository;

  late LocalStorageService _localStorageService;

  JwtObrasService(){

    _obrasRepository = GetIt.I.get<ObrasRepository>();

    GetIt.I
    .getAsync<LocalStorageService>()
    .then((value) => _localStorageService = value);
  }

  @override
  Future<User?> getCurrentUser() async{

    String loginUser = _localStorageService.getFromDisk("user");

    if(loginUser != null){

      var user = LoginResponse.fromJson(jsonDecode(loginUser));

      return User(
        name: user.fullName ?? '',
        username: user.username ?? '', 
        accessToken: user.token ?? '', 
        email: '');
    }

    return null;
  }

  @override
  Future<List<ObrasModel>> getAllObras() async{

    print("Se alcanza");
    
    List<ObrasModel> response = (await _obrasRepository.getAllObras()) as List<ObrasModel>;

    await _localStorageService.saveToDisk('obrasList', jsonEncode(jsonEncode(response)));

    return response;
  }
  
}