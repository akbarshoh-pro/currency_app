import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<OpenHomeScreenEvent>((event, emit) => _openHome(event, emit));
  }

  void _openHome(event, emit) {
    emit(state.copyWith(openHome: true));
  }
}
