import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/routes_location.dart';
import '../../blocs/splash/splash_bloc.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      context.read<SplashBloc>().add(OpenHomeScreenEvent());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.openHome!) {
          Navigator.pushReplacementNamed(context, RoutesLocation.homeScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: Center(
              child: Image.asset(width: 100, 'assets/images/ic_splash.png'),
            ),
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}

