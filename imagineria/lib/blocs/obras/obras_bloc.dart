import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_event.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_state.dart';
import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';
import 'package:flutter_bloc_authentication/repositories/repositories.dart';
import 'package:flutter_bloc_authentication/services/authentication_service.dart';
import 'package:flutter_bloc_authentication/services/obras_service.dart';

class ObrasBloc extends Bloc<ObrasEvent, ObrasState> {
  
  final AuthenticationService _authenticationService;

  ObrasBloc(AuthenticationService authenticationService, this._authenticationService) : assert(authenticationService != null),

  super(ObrasInitial()){

    on<Loading>(_onAppLoaded);
    on<ObrasPressed>(_onObrasPressed);
  }

  _onAppLoaded(

    Loading event,

    Emitter<ObrasState> emit,
  ) async {

    print("Se alcanza también");

    final obrasService = getIt<JwtObrasService>();

    emit(ObrasLoading());
    try{

      await Future.delayed(Duration(milliseconds: 600));

      final currentUser = await _authenticationService.getCurrentUser();

      final obras = await obrasService.getAllObras();

      if(obras.length >= 0){

        emit(ObrasLoaded(obras: obras));
      }
    } on Exception catch (e){

      emit(ObrasError(error : "Ha ocurrido un error: ${e.toString()}"));
    }
  }

  _onObrasPressed(ObrasPressed event, Emitter<ObrasState> emit) async{

    emit(ObrasLoading());

    try{

      final user = await _authenticationService.getCurrentUser();

      if(user != null){

      } else {

        emit(ObrasError(error: "Se realizó"));
      }
    }on Exception catch (e){

      emit(ObrasError(error: e.toString()));
    }
  }
}
