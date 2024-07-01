
import 'package:currency_app/navigation/routes_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/blocs/home/home_bloc.dart';
import '../presentation/blocs/splash/splash_bloc.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutesLocation.splashScreen:
        return MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                  create: (context) => SplashBloc(),
                child: const SplashScreen(),
              );
            }
        );
      case RoutesLocation.homeScreen:
        return MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                create: (context) => HomeBloc()..add(LoadAllCurrencies()),
                child: const HomeScreen(),
              );
            }
        );
      default: return  MaterialPageRoute(
          builder: (context) => const Center(
            child:  Text('No this route'),
          )
      );
    }
  }
}