part of 'forgotPassword.bloc.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {
  final String message;

  ForgotPasswordLoading({this.message});
}

class ForgotPasswordFail extends ForgotPasswordState {
  final String username;
  String wrong;

  final Status status;

  ForgotPasswordFail({
    this.username,
    this.status,
    this.wrong,
  });
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String route, message;
  String username;

  ForgotPasswordSuccess({
    this.message,
    this.route,
    this.username,
  });
}
