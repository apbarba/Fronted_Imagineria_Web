import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_event.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_state.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';
import 'package:flutter_bloc_authentication/repositories/repositories.dart';

class ObrasBloc extends Bloc<ObrasEvent, ObrasState> {
  ObrasBloc() : super(ObrasInitial()) {
    final ObrasRepository _obrasRepository = ObrasRepository();

    on<GetObrasList>((event, emit) async {
      try {
        emit(ObrasLoading());
        final list = await _obrasRepository.fetchObras();

        emit(ObrasLoaded(list as ObrasModel));

        //   if (list.error != null){

        //     emit(ObrasError(list.error));
        //    }
      } on NetworkError {
        emit(ObrasError("No se han podido mostrar las obras"));
      }
    });
  }
}
