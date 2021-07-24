part of 'login.bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginShowEvent extends LoginEvent {}

class LoginSubmitEvent extends LoginEvent {
  final String username, password;

  LoginSubmitEvent(this.username, this.password);
}

class LoginShowPassEvent extends LoginEvent {
  final String username, password;
  final bool showPassword;

  LoginShowPassEvent(
    this.username,
    this.password,
    this.showPassword,
  );
}
