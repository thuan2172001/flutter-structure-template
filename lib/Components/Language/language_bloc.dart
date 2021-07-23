import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_auth/Models/language.dart';
import 'package:flutter_auth/Services/Storage/language_storage_service.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial());

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LanguageShowEvent) {
      Language language = LanguageStorageService.getLanguage();
      yield LanguageSuccess(language: language);
    }
    if (event is LanguageChangeEvent) {
      Language language = event.language;
      yield LanguageSuccess(language: language);
    }
  }
}
