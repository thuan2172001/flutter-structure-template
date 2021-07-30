import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_auth/Proto/test.dart';
import 'package:flutter_auth/Repository/login_repository.dart';
import 'package:flutter_auth/Repository/user_repository.dart';
import 'package:flutter_auth/Data/login_data.dart';
import 'package:flutter_auth/Models/status.dart';
import 'package:flutter_auth/Models/user.dart';
import 'package:flutter_auth/Services/Api/signature_service.dart';
import 'package:flutter_auth/Function/date_format.dart';
import 'package:flutter_auth/Services/Storage/user_storage_service.dart';
import 'package:flutter_auth/Services/Api/certificate_service.dart';
import 'package:flutter_auth/Validator/login_validator.dart';
import 'package:flutter_auth/Validator/response_validator.dart';
import 'package:meta/meta.dart';

part 'login.event.dart';
part 'login.state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  Status statusOK = new Status(status: "OK", message: "");

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoginShowEvent) {
      yield LoginFail(
          status: statusOK, username: "", password: "", showPassword: false);
    }
    if (event is LoginSubmitEvent) {
      var test = await TestGrpc.sayHello(['madagascar']);
      print(test);
      yield LoginLoading(message: "LOADING.LOGIN");
      Response responseCredential = await UserAPI.getCredential(event.username);
      Status validateUsername = ResponseValidator.check(responseCredential);
      if (validateUsername.status == "OK") {
        print({"data": responseCredential});
        var data = responseCredential.data["data"];
        var publicKey = data['publicKey'];
        var encryptedPrivateKey = data['encryptedPrivateKey'];
        String privateKey =
            decryptAESCryptoJS(encryptedPrivateKey, event.password);
        Status validatePassword = LoginValidator.checkPassword(privateKey);
        if (validatePassword.status == "SUCCESS") {
          var certificateInfo =
              SignatureService.getCertificateInfo(event.username);

          String signature =
              SignatureService.getSignature(certificateInfo, privateKey);
          String times = TimeService.getTimeNow().toString();
          String certificate = SignatureService.getCertificateLogin(
              certificateInfo, signature, publicKey, times);
          String _signature =
              SignatureService.getSignature(certificate, privateKey);
          String certificateFinal = SignatureService.getCertificateFinal(
              certificateInfo, signature, _signature, publicKey, times);

          Response responsePing =
              await LoginApi.getPing(certificate, certificateFinal);
          Status validateServer2 = ResponseValidator.check(responsePing);
          print({'pingData': validateServer2.status});
          if (validateServer2.status == "OK") {
            var dataPing = responsePing.data['data'];
            UserStorageService.removeUser();
            User user = LoginData.getUser(dataPing);
            user.certification = certificate;
            user.publicKey = publicKey;
            user.privateKey = privateKey;
            user.encryptedPrivateKey = encryptedPrivateKey;
            UserStorageService.setUser(user);
            print({'email': user.id});
            yield LoginSuccess(message: "3 2 1 ...", route: "/homepage");
          } else if (validateServer2.message ==
              "AUTH.ERROR.NEED_TO_CHANGE_PASSWORD") {
            UserStorageService.removeUser();
            yield LoginSuccess(
                message: "Đang vào màn hình đổi mật khẩu",
                route: "/newPassword",
                username: event.username,
                publicKey: publicKey,
                privateKey: privateKey);
          } else
            yield LoginFail(
                username: event.username,
                password: event.password,
                showPassword: false,
                status: validateServer2);
        } else {
          yield LoginFail(
              username: event.username,
              password: event.password,
              showPassword: false,
              status: validatePassword,
              wrong: "password");
        }
      } else
        yield LoginFail(
            username: event.username,
            password: event.password,
            showPassword: false,
            status: validateUsername,
            wrong: "username");
    }
    if (event is LoginShowPassEvent) {
      yield LoginFail(
        username: event.username,
        password: event.password,
        showPassword: true,
      );
    }
  }
}
