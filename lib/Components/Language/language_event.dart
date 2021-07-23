part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class LanguageShowEvent extends LanguageEvent {
  LanguageShowEvent();
}

class LanguageChangeEvent extends LanguageEvent {
  final Language language;

  LanguageChangeEvent({this.language});
}
