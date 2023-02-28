import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_event.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_state.dart';
import 'package:flutter_bloc_authentication/repositories/obras_repository.dart';
import 'package:flutter_bloc_authentication/services/authentication_service.dart';

class ObrasBloc extends Bloc<ObrasEvent, ObrasState> {
  final AuthenticationBloc _authenticationBloc;
  final ObrasRepository _obrasRepository;

  ObrasBloc(
      AuthenticationBloc authenticationBloc, ObrasRepository obrasRepository)
      : assert(authenticationBloc != null),
        assert(obrasRepository != null),
        _authenticationBloc = authenticationBloc,
        _obrasRepository = obrasRepository,
        super(ObrasInitial()) {
    on<ObrasButtonPresses>(_onObrasButtonPresses);
  }

  _onObrasButtonPresses(
    ObrasButtonPresses event,
    Emitter<ObrasState> emit,
  ) async {
    emit(ObrasLoading());

    try {
      print('ButtonPresses');

      final user = await _obrasRepository.addObras1(event.name, event.precio,
          event.titulo, event.img, event.estado, event.fecha, event.estilo,event.categoria);

      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));

        emit(ObrasSuccess());
      } else {
        emit(ObrasError(error: 'error'));
      }
    } on Exception catch (e) {
      emit(ObrasError(error: e.toString()));
    }
  }
}
