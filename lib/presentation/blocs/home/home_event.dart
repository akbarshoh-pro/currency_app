part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadAllCurrencies extends HomeEvent {}

class ChangeLang extends HomeEvent {
  LangStatus status;
  ChangeLang({
    required this.status
  });
}

class LoadAllByDate extends HomeEvent {
  String date;

  LoadAllByDate({
    required this.date
  });
}

class OpenBottomPart extends HomeEvent {
  int index;
  OpenBottomPart({
    required this.index
  });
}
