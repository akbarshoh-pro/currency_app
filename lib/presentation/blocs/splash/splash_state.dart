part of 'splash_bloc.dart';

class SplashState {
  bool? openHome;

  SplashState({
    this.openHome
  });

  SplashState copyWith({bool? openHome}) => SplashState(openHome: openHome ?? this.openHome);
}

