

import 'package:flutter_bloc_authentication/models/models.dart';

abstract class ObrasService{

  Future<User?> getCurrentUser();

  Future<List<ObrasModel>> getAllObras();
}