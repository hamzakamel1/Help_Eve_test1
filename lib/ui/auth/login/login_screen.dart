import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatilaqi/bloc/authentication/authentication_bloc.dart';
import 'package:hatilaqi/bloc/authentication/bloc.dart';
import 'package:hatilaqi/bloc/login/login_bloc.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/ui/home/home_screen.dart';
import 'package:hatilaqi/utils/animations.dart';
import 'package:hatilaqi/utils/images.dart';
import '../forgot_password_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  LoginBloc _loginBloc;

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  AnimationController animationController;
  Animation animation1, animation2, animation3;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _phoneController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation1 = getMyAnimation(animationController, 9);

    animation2 = getMyAnimation(animationController, 10);

    animation3 = getMyAnimation(animationController, 11);
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    animationController.forward();
    return BlocListener<LoginBloc, LoginState>(
      cubit: _loginBloc,
      listener: (context, state) {
        if (state is LoginStateFailure) {}
        if (state is LoginStateLoading) {}
        if (state is LoginStateSuccess) {
          // print("isSuccess");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        cubit: _loginBloc,
        builder: (context, state) {
          return AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Scaffold(
                  body: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(height: _height * 0.15),
                      Transform(
                        transform: Matrix4.translationValues(
                            0, animation2.value * _height, 0),
                        child: Image.asset(
                          getAppIcon(),
                          width: 90,
                          height: 90,
                        ),
                      ),
                      SizedBox(height: 40),
                      Transform(
                        transform: Matrix4.translationValues(
                            animation1.value * _width, 0, 0),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: _width * 0.15, right: _width * 0.15),
                          height: 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.phone_android),
                                  hintText: tr('enter_phone_number'),
                                  labelText: tr('phone_number'),
                                  // errorText: !state.isEmailValid
                                  //     ? tr('invalid_phone_number')
                                  //     : null,
//            prefixIcon: const Icon(Icons.person),
                                ),
                              ),
                              SizedBox(height: paddingBig),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  hintText: tr('enter_password'),
                                  labelText: tr('password'),
                                  // errorText: !state.isPasswordValid
                                  //     ? tr('invalid_password')
                                  //     : null
//            prefixIcon: const Icon(Icons.lock),
                                ),
                              ),
                              SizedBox(height: paddingBig),
                              SizedBox(
                                width: double.maxFinite,
                                child: RaisedButton(
                                  onPressed: () {
                                    _onFormSubmitted();
                                  },
                                  child: Text(tr('login')),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(tr('forget_passwords')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12),
                      // Transform(
                      //   transform: Matrix4.translationValues(
                      //       0, animation3.value * _height, 0),
                      //   child: buildText(),
                      // ),
                      SizedBox(height: 30),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  // Widget buildText() {
  //   return GestureDetector(
  //     onTap: _onClickSignUp,
  //     child: Text.rich(
  //       TextSpan(
  //         text: tr('Do_not_have_an_account'),
  //         style: TextStyle(fontFamily: 'Quicksand'),
  //         children: <TextSpan>[
  //           TextSpan(
  //               text: tr('signup'),
  //               style: TextStyle(
  //                 fontFamily: 'Quicksand',
  //                 fontWeight: FontWeight.bold,
  //                 decoration: TextDecoration.underline,
  //               )),
  //           // can add more TextSpans here...
  //         ],
  //       ),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _phoneController.text),
    );
  }

  void _onClickSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        phone: _phoneController.text,
        password: _passwordController.text,
      ),
    );
  }
}
