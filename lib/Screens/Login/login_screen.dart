import 'package:flutter/material.dart';
import 'package:flutter_auth/Function/middleware.dart';
import 'package:flutter_auth/Screens/Login/login_bloc.dart';
import 'package:flutter_auth/UI/alert_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (contextBloc) => LoginBloc()..add(LoginShowEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginSuccess) {
              if (state.status.message == "WRONG.PASSWORD" ||
                  state.status.message == "AUTH.ERROR.USER_NOT_FOUND") {
              } else if (state.status.message.contains("AUTH.")) {
                state.status.message = "Tài khoản không hợp lệ";
                // AlertComponent(context).show(state.status);
              }
              return bodyBloc(context, state);
            } else if (state is LoginLoading) {
              return Text('Loading');
            } else {
              if (state is LoginExit) {
                Future.delayed(
                    Duration.zero,
                    () async => await MiddleWare.pushAndReplace(
                            context, state.route, arguments: [
                          state.username,
                          state.publicKey,
                          state.privateKey
                        ]));
                print('LoginExit 36');
              }
              return Container();
            }
          }),
        ),
      ),
    );
  }

  Widget bodyBloc(BuildContext context, LoginSuccess state) {
    String username = state.username;
    String password = state.password;
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            // child: Image.asset(
            //   'assets/images/loginTop.png',
            //   fit: BoxFit.fitWidth,
            // ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/loginTop.jpeg',
                // ),
                // MediaQuery.of(context).size.height > 800
                //     ? SizedBox(
                //         height: 50,
                //       )
                //     : Container(),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 15),
                        child: Text(
                          'Vui lòng đăng nhập để tiếp tục',
                          style: TextStyle(
                            fontFamily: 'SVN-Gilroy',
                            // fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xFF0B9446),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(top: 47),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person_outline,
                                      color: Color(0xFF37B44E),
                                      size: 28,
                                    ),
                                    hintText: 'Tên đăng nhập',
                                    hintStyle: TextStyle(
                                        fontFamily: "SVN-Gilroy",
                                        fontWeight: FontWeight.w300),
                                    fillColor: Colors.white70,
                                    border: InputBorder.none),
                                onChanged: (String value) {
                                  username = value;
                                },
                                controller: TextEditingController()
                                  ..text = username,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        child: Container(
                          color: Color(0xFFF0F0F3),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: TextFormField(
                                    controller: TextEditingController()
                                      ..text = password,
                                    obscureText:
                                        state.showPassword ? false : true,
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<LoginBloc>(context)
                                                .add(LoginShowPassEvent(
                                                    username,
                                                    password,
                                                    !state.showPassword));
                                          },
                                          child: Icon(
                                            state.showPassword
                                                ? Icons.lock_open
                                                : Icons.lock_outline,
                                            color: Color(0xFF37B44E),
                                            size: 28,
                                          ),
                                        ),
                                        hintText: 'Mật khẩu',
                                        hintStyle: TextStyle(
                                            fontFamily: "SVN-Gilroy",
                                            fontWeight: FontWeight.w300),
                                        fillColor: Colors.white70,
                                        border: InputBorder.none),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        child: Container(
                          color: Color(0xFFF0F0F3),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginSubmitEvent(username, password));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 35,
                          ),
                          // color: Color(0xFF37B44E),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF37B44E),
                            // color: Colors.black,
                            border: Border.all(color: Color(0xFF37B44E)),
                          ),
                          child: Center(
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Image.asset(
          //     'assets/images/loginBottom.jpeg',
          //   ),
          // ),
        ],
      ),
    ));
  }
}
