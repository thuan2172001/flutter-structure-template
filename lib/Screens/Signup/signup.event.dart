part of 'signup.bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupShowEvent extends SignupEvent {}

class SignupSubmitEvent extends SignupEvent {
  final String username, password, confirmPassword;

  SignupSubmitEvent(
    this.username,
    this.password,
    this.confirmPassword,
  );
}

class SignupShowPassEvent extends SignupEvent {
  final String username, password, confirmPassword;
  final bool showPassword;

  SignupShowPassEvent(
    this.username,
    this.password,
    this.confirmPassword,
    this.showPassword,
  );
}
