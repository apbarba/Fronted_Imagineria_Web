import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import 'package:flutter_bloc_authentication/blocs/register/register_event.dart';
import 'package:flutter_bloc_authentication/blocs/register/register_state.dart';
import 'package:flutter_bloc_authentication/services/services.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  RegisterBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    try {
      print('ButtonPresses:' + event.username);

      final user = await _authenticationService.register(event.username,
          event.password, event.verifyPassword, event.email, event.name);

      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));

        emit(RegisterSuccess());
      } else {
        emit(RegisterError(error: 'Error'));
      }
    } on Exception catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}
