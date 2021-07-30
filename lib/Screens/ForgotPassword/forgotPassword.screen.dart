import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';
import 'package:flutter_auth/Config/font_config.dart';
import 'package:flutter_auth/Function/middleware.dart';
import 'package:flutter_auth/Screens/ForgotPassword/forgotPassword.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (contextBloc) =>
          ForgotPasswordBloc()..add(ForgotPasswordShowEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
            if (state is ForgotPasswordFail) {
              return bodyBloc(context, state);
            } else {
              if (state is ForgotPasswordSuccess) {
                Future.delayed(
                    Duration.zero,
                    () async => await MiddleWare.pushAndReplace(
                            context, state.route,
                            arguments: [
                              state.username,
                            ]));
                print('Sent mail !!! 32');
              }
              return Container();
            }
          }),
        ),
      ),
    );
  }
}

Widget bodyBloc(BuildContext context, ForgotPasswordFail state) {
  String username = state.username;
  return SingleChildScrollView(
      child: Container(
    height: MediaQuery.of(context).size.height,
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 15),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontFamily: FontConfig.mainFont,
                            fontSize: 40,
                            color: Theme.of(context).primaryColor),
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
                                    color: Theme.of(context).primaryColor,
                                    size: 28,
                                  ),
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      fontFamily: FontConfig.mainFont,
                                      fontWeight: FontWeight.w300),
                                  fillColor: Theme.of(context).primaryColor,
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
                        color: ColorConfig.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        BlocProvider.of<ForgotPasswordBloc>(context)
                            .add(ForgotPasswordSubmitEvent(username));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 35,
                        ),
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 16, color: Colors.white),
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
      ],
    ),
  ));
}
