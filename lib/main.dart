import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: _cuppingTheme,
      home: Home(title: APP_TITLE),
    );
  }
}

final ThemeData _cuppingTheme = _buildCuppingTheme();

ThemeData _buildCuppingTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: cuppingTeal,
    accentColor: cuppingBrown2,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: cuppingBrown1,
      colorScheme: base.colorScheme.copyWith(secondary: cuppingBlack),
    ),
    scaffoldBackgroundColor: cuppingWhite,
    cardColor: cuppingBrown1,
    textTheme: _buildCuppingTextTheme(base.textTheme),
    primaryTextTheme: _buildCuppingTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCuppingTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildCuppingTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'OpenSans',
        displayColor: Colors.red, // seems to affect HUGE headlines (not headline5/6)
        bodyColor: cuppingBlack, // this one affects most of the text
      );
}
