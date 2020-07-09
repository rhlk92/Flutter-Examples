import 'package:FlutterWeather/bloc/authentication/authentication_bloc.dart';
import 'package:FlutterWeather/bloc/authentication/authentication_event.dart';
import 'package:FlutterWeather/bloc/login/logic_state.dart';
import 'package:FlutterWeather/bloc/login/login_event.dart';
import 'package:FlutterWeather/repositories/user/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(AuthenticationLoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
