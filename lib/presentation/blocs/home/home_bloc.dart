
import 'package:currency_app/utils/lang_status.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/source/model/currency_model.dart';
import '../../../domain/app_repository.dart';
import '../../../domain/impl/app_repository_imp.dart';
import '../../../utils/status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRepository _repo = AppRepositoryImp();
  HomeBloc() : super(HomeState(status: Status.initial, langStatus: LangStatus.uz, openBottom: false, openedIndex: -1)) {
    on<LoadAllCurrencies>((event, emit) => _loadCurrencies(event, emit));

    on<OpenBottomPart>((event, emit) => _openBottomPart(event, emit));

    on<LoadAllByDate>((event, emit) => _loadAllByDate(event, emit));

    on<ChangeLang>((event, emit) => _changeLang(event, emit));

  }

  void _loadCurrencies(event, emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      var list = await _repo.getAllCurrencies();
      emit(state.copyWith(status: Status.success, list:  list));
    } on DioException catch(e) {
      emit(state.copyWith(status: Status.failure, error: e.message));
    }
  }

  void _openBottomPart(OpenBottomPart event, emit) {
    if(state.openedIndex == event.index && state.openBottom!) {
      emit(state.copyWith(openBottom: false));
    } else if(state.openedIndex == event.index && !state.openBottom!) {
      emit(state.copyWith(openBottom: true));
    } else {
      emit(state.copyWith(openBottom: true, openedIndex: event.index));
    }
  }

  void _loadAllByDate(LoadAllByDate event, emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      List<CurrencyModel> list = await _repo.getAllByDate(event.date);
      emit(state.copyWith(status: Status.success, list: list));
    } on DioException catch(e) {
      emit(state.copyWith(status: Status.failure, error: e.message));
    }
  }

  void _changeLang(ChangeLang event, emit) {
    emit(state.copyWith(langStatus: event.status));
  }
}
