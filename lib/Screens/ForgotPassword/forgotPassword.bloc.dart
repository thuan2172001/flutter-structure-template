import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Repository/user_repository.dart';
import 'package:flutter_auth/Validator/response_validator.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'forgotPassword.event.dart';
part 'forgotPassword.state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial());
  Status statusOK = new Status(status: "OK", message: "");

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordShowEvent) {
      yield ForgotPasswordFail(
        status: statusOK,
        username: "",
      );
    }
    if (event is ForgotPasswordSubmitEvent) {
      yield ForgotPasswordLoading(message: "LOADING.FORGOT_PASSWORD");
      Response responseCredential = await UserAPI.getCredential(event.username);
      Status validateUsername = ResponseValidator.check(responseCredential);
      if (validateUsername.status == "OK") {
        yield ForgotPasswordSuccess(
          route: '/forgotPassword-confirm',
          message: 'redirect to confirm mail',
          username: event.username,
        );
      } else {
        yield ForgotPasswordFail(username: event.username, wrong: "username");
      }
    }
  }
}
