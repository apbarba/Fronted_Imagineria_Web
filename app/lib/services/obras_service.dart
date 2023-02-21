import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';
import 'package:flutter_bloc_authentication/repositories/repositories.dart';
import 'package:flutter_bloc_authentication/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';

class ObrasService {
  late LocalStorageService _localStorageService;

  late ObrasRepository _obrasRepository;

  ObrasService() {
    _obrasRepository = getIt<ObrasRepository>();

    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  Future<List<ObrasModel>?> getObras() async {
    String? token = _localStorageService.getFromDisk("user");

    if (token != null) {
      List<ObrasModel>? response =
          (await _obrasRepository.findAllObras()) as List<ObrasModel>?;

      return response;
    }

    throw Exception('Fallado');
  }
}
