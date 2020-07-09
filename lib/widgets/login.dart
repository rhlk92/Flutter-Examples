import 'package:FlutterWeather/bloc/authentication/authentication_bloc.dart';
import 'package:FlutterWeather/bloc/login/login_bloc.dart';
import 'package:FlutterWeather/repositories/user/user_repository.dart';
import 'package:FlutterWeather/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final UserRepository userRepository;

  Login({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
