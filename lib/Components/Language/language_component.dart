import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Language/language_bloc.dart';
import 'package:flutter_auth/Models/language.dart';
import 'package:flutter_auth/Models/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropdownComponent {
  final BuildContext context;
  Language valueOutput;

  LanguageDropdownComponent(this.context);

  Widget show() {
    return BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc()..add(LanguageShowEvent()),
        child:
            BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
          if (state is LanguageSuccess) {
            valueOutput = state.language;
            return Container(
                padding: EdgeInsets.only(
                    left: 10, right: 10),
                child: DropdownButton<Language>(
                  isExpanded: true,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: state.language,
                  onChanged: (Language language) async {
                    BlocProvider.of<LanguageBloc>(context)
                        .add(LanguageChangeEvent(language: language));
                  },
                  items: Storage.listLanguage.map((Language language) {
                    return DropdownMenuItem<Language>(
                        value: language,
                        child: Row(children: [
                          Text(language.languageName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'SVN-Gilroy',
                              )),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            alignment: Alignment.topLeft,
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(language.file),
                              ),
                            ),
                          ),
                        ]));
                  }).toList(),
                ));
          } else
            return Container();
        }));
  }
}
