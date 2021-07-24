import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_auth/Repository/email_repository.dart';
import 'package:flutter_auth/Repository/user_repository.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Validator/response_validator.dart';
import 'package:meta/meta.dart';

part 'signup.event.dart';
part 'signup.state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());
  Status statusOK = new Status(status: "OK", message: "");

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupShowEvent) {
      yield SignupFail(
          status: statusOK,
          username: "",
          password: "",
          confirmPassword: "",
          showPassword: false);
    }
    if (event is SignupSubmitEvent) {
      yield SignupLoading(message: "LOADING.SIGNUP");
      Response response = await UserAPI.signup(event.username, event.password);
      Response emailResponse = await EmailApi.verifyMail(event.username, "verify-email");
      Status responseStatus = ResponseValidator.check(response);
      Status emailResponseStatus = ResponseValidator.check(emailResponse);
      if (responseStatus.status == "OK") {
        if (emailResponseStatus.status == "OK") {
          print('Sent mail successfully!');
        }    
        yield SignupSuccess(
          message: 'redirect to login page',
          route: "/login",
        );
      } else {
        yield SignupFail(
          username: event.username,
          password: event.password,
          confirmPassword: event.confirmPassword,
          showPassword: false,
        );
      }
    }
    if (event is SignupShowPassEvent) {
      yield SignupFail(
        username: event.username,
        password: event.password,
        confirmPassword: event.confirmPassword,
        showPassword: true,
      );
    }
  }
}
