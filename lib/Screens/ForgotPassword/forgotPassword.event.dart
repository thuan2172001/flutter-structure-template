part of 'forgotPassword.bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgotPasswordShowEvent extends ForgotPasswordEvent {}

class ForgotPasswordSubmitEvent extends ForgotPasswordEvent {
  final String username;

  ForgotPasswordSubmitEvent(this.username);
}
