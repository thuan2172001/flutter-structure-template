part of 'login.bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final String message;

  LoginLoading({this.message});
}

class LoginFail extends LoginState {
  final String username, password;
  final bool showPassword;
  String wrong;

  final Status status;

  LoginFail({
    this.username,
    this.password,
    this.showPassword,
    this.status,
    this.wrong,
  });
}

class LoginSuccess extends LoginState {
  final String route, message;
  String username, publicKey, privateKey;

  LoginSuccess({
    this.message,
    this.route,
    this.username,
    this.publicKey,
    this.privateKey,
  });
}
