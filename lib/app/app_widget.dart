import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:BreakingBadApp/theme/colors/light_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: LightColors.kDarkBlue,
              displayColor: LightColors.kDarkBlue,
              fontFamily: 'Poppins')),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
