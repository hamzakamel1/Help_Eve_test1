import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hatilaqi/bloc/authentication/authentication_bloc.dart';
import 'package:hatilaqi/bloc/authentication/authentication_state.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/ui/home/home_screen.dart';
import 'package:hatilaqi/ui/language/language_screen.dart';
import 'package:hatilaqi/ui/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(bloc: AuthenticationBloc());
}

class _MyAppState extends State<MyApp> {
  final AuthenticationBloc bloc;

  _MyAppState({this.bloc});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.orange;
    final primaryColorLight = Colors.orangeAccent.shade400;
    final primaryColorDark = Colors.orange.shade800;
    final accentColor = Colors.tealAccent.shade700;
    // final backgroundColor = Colors.white;
    final errorColor = Colors.red.shade600;

    return BlocProvider<AuthenticationBloc>(
      create: (context) => bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorLight: primaryColorLight,
          primaryColorDark: primaryColorDark,
          primaryColorBrightness: Brightness.light,
          accentColor: accentColor,
          accentColorBrightness: Brightness.light,
          /////////////////////////  Text  ////////////////////////////////

          primaryTextTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
          accentTextTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
          ///////////////////////     cardTheme   ////////////////////////////
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 12.0,
            margin: const EdgeInsets.all(4.0),
            shape: cardRounded,
          ),
          //////////////////////////////////////////////////////////////////
          buttonTheme: ButtonThemeData(
              shape: buttonCircularBorder,
              buttonColor: primaryColor,
              textTheme: ButtonTextTheme.primary),
          /////////////////////////////////////////////////////////////////////
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            errorStyle: TextStyle(color: errorColor),
//            labelStyle: inputTheme.labelStyle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: roundBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.5),
              borderRadius: roundBorderRadius,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor),
              borderRadius: roundBorderRadius,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor, width: 1.5),
              borderRadius: roundBorderRadius,
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            splashColor: accentColor,
            elevation: 4.0,
            highlightElevation: 2,
            shape: StadiumBorder(),
          ),
        ),
        home: BlocBuilder(
          cubit: bloc,
          builder: (context, state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Authenticated) {
              return HomeScreen();
            }
            if (state is Unauthenticated) {
              return HomeScreen();
            }
            if (state is FirstOpenApp) {
              return LanguageScreen();
            }
            // if(state is MostUpdateApp){
            //   return AboutAppScreen();
            // }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
