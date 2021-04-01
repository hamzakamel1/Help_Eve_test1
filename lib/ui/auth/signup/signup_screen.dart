import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatilaqi/modle/data_list.dart';
import 'package:hatilaqi/modle/users.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/ui/home/home_screen.dart';
import 'package:hatilaqi/utils/animations.dart';
import 'package:hatilaqi/utils/dropdown.dart' as Dropdown;
import 'package:hatilaqi/bloc/signup/signup_bloc.dart';
import 'package:hatilaqi/utils/validation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  Color _color1 = ThemeData().primaryColor;
  Color _color2 = Colors.white;
  String _gender = 'male';

  AnimationController controller;
  Animation topAnimation1,
      topAnimation2,
      topAnimation3,
      bottomAnimation1,
      bottomAnimation2,
      bottomAnimation3,
      sideAnimation1,
      sideAnimation2;

  SignUpBloc _bloc;

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isLoading = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final focusPhone = FocusNode();
  final focusPassword = FocusNode();
  final focusConfirmPassword = FocusNode();

  ////////////////////////////////////////////////////////////////////////
  List<DataList> genderList = <DataList>[
    DataList(name: tr('male'), id: 1, keyValue: 'male'),
    DataList(name: tr('female'), id: 2, keyValue: 'female'),
  ];
  DataList genderValue;

  void genderSelected(newValue) {
    setState(() {
      genderValue = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = SignUpBloc();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    ////////////////////////////////////////////////////////////////////////
    topAnimation1 = getMyAnimation(controller, 1);

    topAnimation2 = getMyAnimation(controller, 2);

    topAnimation3 = getMyAnimation(controller, 3);

    bottomAnimation1 = getMyAnimation(controller, 4);

    bottomAnimation2 = getMyAnimation(controller, 5);

    bottomAnimation3 = getMyAnimation(controller, 6);

    sideAnimation1 = getMyAnimation(controller, 7);

    sideAnimation2 = getMyAnimation(controller, 8);
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    controller.forward();

    return BlocListener(
        cubit: _bloc,
        listener: (context, state) {
          if (state is SignUpFailure) {}
          if (state is Initial) {}
          if (state is SignUpSuccess) {
            // doneSendRequestDialog();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(tr("signup")),
                ),
                body: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Transform(
                        transform: Matrix4.translationValues(
                            0, topAnimation3.value * _height, 0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(focusPhone);
                          },
                          decoration: InputDecoration(
                            hintText: tr('enter_full_name'),
                            labelText: tr('full_name'),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) => isValidCharacters(value)
                              ? null
                              : tr('invalid_name'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Transform(
                          transform: Matrix4.translationValues(
                              0, topAnimation2.value * _height, 0),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            focusNode: focusPhone,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusPassword);
                            },
                            decoration: InputDecoration(
                              hintText: tr('enter_phone_number'),
                              labelText: tr('phone_number'),
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            validator: (value) => isValidPhone(value)
                                ? null
                                : tr('invalid_phone'),
                          )),
                      SizedBox(height: 20),
                      Transform(
                          transform: Matrix4.translationValues(
                              0, topAnimation2.value * _height, 0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            focusNode: focusPassword,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusConfirmPassword);
                            },
                            decoration: InputDecoration(
                              hintText: tr('enter_password'),
                              labelText: tr('password'),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            validator: (value) => isValidPassword(value)
                                ? null
                                : tr('invalid_password'),
                          )),
                      SizedBox(height: 20),
                      Transform(
                          transform: Matrix4.translationValues(
                              0, topAnimation2.value * _height, 0),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            focusNode: focusConfirmPassword,
                            decoration: InputDecoration(
                              hintText: tr('enter_confirm_password'),
                              labelText: tr('confirm_password'),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            validator: (value) => isValidConfirmPassword(
                                    value, passwordController.text)
                                ? null
                                : tr('confirm_password'),
                          )),
                      SizedBox(height: 20),
                      Transform(
                        transform: Matrix4.translationValues(
                          0,
                          bottomAnimation3.value * _height,
                          0,
                        ),
                        child: buildNextButton(),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Padding buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(left: 80, right: 80),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: _submitSignUp,
        child: Text(
          tr('signup'),
          style: TextStyle(color: Colors.white),
        ),
        color: ThemeData().primaryColor,
      ),
    );
  }

  void _submitSignUp() {
    if (_formKey.currentState.validate()) {
      print(nameController.text);
      _bloc.add(
        SignUpUser(
          user: User(
              name: nameController.text,
              phone: phoneController.text,
              gender: "male",
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text),
        ),
      );
    }
  }

  void doneSendRequestDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: cardRounded,
            backgroundColor: Colors.green.shade600,
            title: Center(
              child: Text(
                tr('done_send'),
                style: TextStyle(color: Colors.white),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 70,
                ),
                SizedBox(height: paddingBig),
                Flexible(
                    child: Text(
                  tr('message_sign_up_done'),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          );
        });
  }

  Color colorBorderError = Colors.grey.shade600;

  Widget getDropDownWidget<T>({listItem, onChanged, hintTitle, defaultValue}) {
//    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingBig),
        border: Border.all(
            width: 1.5,
            color: defaultValue == null
                ? colorBorderError
                : Theme.of(context).primaryColor),
      ),
      height: max(35, height * 0.075),
      margin: EdgeInsets.only(top: marginMin),
      child: Dropdown.DropdownButton<T>(
        value: defaultValue,
        hint: Padding(
          padding: EdgeInsets.only(right: marginMin, left: marginMin),
          child: Text(hintTitle),
        ),
        onChanged: onChanged,
        items: listItem,
        isExpanded: true,
        underline: SizedBox(),
        itemHeight: max(30, height * 0.075),
      ),
    );
  }
}
