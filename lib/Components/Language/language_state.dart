part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageSuccess extends LanguageState {
  final Language language;

  LanguageSuccess({this.language});
}
