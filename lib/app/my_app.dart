import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../navigation/routes_location.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesLocation.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
