import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/LoadingComponent/loading_component.dart';
import 'package:flutter_auth/Components/SizedBox/MarginSizedBox.dart';
import 'package:flutter_auth/Config/font_config.dart';
import 'package:flutter_auth/Function/middleware.dart';
import 'package:flutter_auth/Screens/Signup/signup.bloc.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (contextBloc) => SignupBloc()..add(SignupShowEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          leading: BackButton(
            onPressed: () {
              MiddleWare.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child:
              BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
            if (state is SignupFail) {
              return bodyBloc(context, state);
            } else if (state is SignupLoading) {
              return LoadingComponent(context);
            } else {
              if (state is SignupSuccess) {
                print(state.route);
                Future.delayed(
                    Duration.zero,
                    () async =>
                        await MiddleWare.pushAndReplace(context, state.route));
                print('Signup successfully !!! 36');
              }
              return Container();
            }
          }),
        ),
      ),
    );
  }

  Widget bodyBloc(BuildContext context, SignupFail state) {
    String username = state.username;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height - 200,
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
                          LanguageStorageService.text('SIGNUP'),
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
                      CustomSizedBox(),
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
                                            BlocProvider.of<SignupBloc>(context)
                                                .add(SignupShowPassEvent(
                                                    username,
                                                    password,
                                                    confirmPassword,
                                                    !state.showPassword));
                                          },
                                          child: Icon(
                                            state.showPassword
                                                ? Icons.lock_open
                                                : Icons.lock_outline,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 28,
                                          ),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            fontFamily: FontConfig.mainFont,
                                            fontWeight: FontWeight.w300),
                                        fillColor:
                                            Theme.of(context).primaryColor,
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
                      CustomSizedBox(),
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
                                      ..text = confirmPassword,
                                    obscureText:
                                        state.showPassword ? false : true,
                                    onChanged: (value) {
                                      confirmPassword = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<SignupBloc>(context)
                                                .add(SignupShowPassEvent(
                                                    username,
                                                    password,
                                                    confirmPassword,
                                                    !state.showPassword));
                                          },
                                          child: Icon(
                                            state.showPassword
                                                ? Icons.lock_open
                                                : Icons.lock_outline,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 28,
                                          ),
                                        ),
                                        hintText: 'Confirm Password',
                                        hintStyle: TextStyle(
                                            fontFamily: FontConfig.mainFont,
                                            fontWeight: FontWeight.w300),
                                        fillColor:
                                            Theme.of(context).primaryColor,
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
                      CustomSizedBox(),
                      GestureDetector(
                        onTap: () async {
                          BlocProvider.of<SignupBloc>(context).add(
                              SignupSubmitEvent(
                                  username, password, confirmPassword));
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
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Center(
                            child: Text(
                              LanguageStorageService.text('SIGNUP'),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
}
