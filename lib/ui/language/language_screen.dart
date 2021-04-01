import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatilaqi/bloc/authentication/authentication_bloc.dart';
import 'package:hatilaqi/bloc/authentication/authentication_event.dart';
import 'package:hatilaqi/ui/widget/item_card.dart';
import 'package:hatilaqi/utils/images.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                getLanguageIcon(),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(height: 16),
              Text(
                tr('select_language'),
                style: TextStyle(color: Colors.teal, fontSize: 20),
              ),
              SizedBox(height: 16),
              ItemCard(
                title: tr('language_arabic'),
                icons: Image.asset(
                  getLanguageArabicIcon(),
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  changeLanguage(Locale('ar', 'DZ'));
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(UnauthenticatedEvent());
                },
              ),
              ItemCard(
                title: tr('language_english'),
                icons: Image.asset(
                  getLanguageEnglishIcon(),
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(UnauthenticatedEvent());
                  changeLanguage(Locale('en', 'US'));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeLanguage(Locale locale) {
    setState(() {
      EasyLocalization.of(context).locale = locale;
    });
  }
}
