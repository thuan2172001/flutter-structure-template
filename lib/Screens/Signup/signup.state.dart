part of 'signup.bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {
  final String message;

  SignupLoading({this.message});
}

class SignupFail extends SignupState {
  final String username, password, confirmPassword;
  final bool showPassword;
  String wrong;

  final Status status;

  SignupFail({
    this.username,
    this.password,
    this.confirmPassword,
    this.showPassword,
    this.status,
    this.wrong,
  });
}

class SignupSuccess extends SignupState {
  final String route, message;

  SignupSuccess({
    this.message,
    this.route,
  });
}
