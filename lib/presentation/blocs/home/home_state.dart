part of 'home_bloc.dart';

class HomeState {
  Status? status;
  LangStatus? langStatus;
  List<CurrencyModel>? list;
  String? error;
  bool? openBottom;
  int? openedIndex;

  HomeState({
    this.status,
    this.langStatus,
    this.list,
    this.error,
    this.openBottom,
    this.openedIndex
  });

  HomeState copyWith({Status? status, LangStatus? langStatus, List<CurrencyModel>? list, String? error, bool? openBottom, int? openedIndex}) =>
      HomeState(status: status ?? this.status, langStatus: langStatus ?? this.langStatus, list: list ?? this.list, error: error ?? this.error, openBottom: openBottom ?? this.openBottom, openedIndex: openedIndex ?? this.openedIndex);
}

