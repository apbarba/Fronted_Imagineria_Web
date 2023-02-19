
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_events.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_state.dart';
import 'package:flutter_bloc_authentication/repositories/obras_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ObrasBloc extends Bloc<ObrasEvent, ObrasState>{

  final ObrasRepositoy _obrasRepositoy;

  ObrasBloc(this._obrasRepositoy) : super(ObrasLoadingState()){

    on<LoadObrasEvent>((event, emit)) async {

      emit(ObrasLoadingState());

      try{
        
        final obras = await _obrasRepositoy.getObras();

        emit(ObrasLoadedState(obras));
      
      }catch (e){
        
        emit(ObrasErrorState(e.toString()));

      }

    }
  }
}