import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatilaqi/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:hatilaqi/ui/auth/TermsConditionPage.dart';
import 'package:hatilaqi/ui/auth/auth_screen.dart';
import 'package:hatilaqi/ui/auth/sheet_new_password.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/utils/validation.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _phoneController = TextEditingController();
  ForgotPasswordBloc _bloc = ForgotPasswordBloc();

  String error;

  @override
  void initState() {
    super.initState();
    // _phoneController.addListener(_onEmailChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _bloc;
      },
      child: Scaffold(
        body: BlocListener(
          cubit: _bloc,
          listener: (context, state) {
            if (state is Initial) {
              setState(() {
                error = state.error;
              });
            }
            if (state is SendCodeSuccess) {
              setState(() {
                error = null;
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TermsConditionPage(state: state,bloc: _bloc,),
                ),
              );
            }
            if (state is ValidateCodeSuccess) {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                enableDrag: false,
                builder: (BuildContext context) {
                  return SheetNewPassword(bloc: _bloc,);
                },
                backgroundColor: Colors.transparent,
              );
            }
            if (state is ChangePasswordSuccess) {
              doneSendRequestDialog();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(paddingBig),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  error != null
                      ? Card(
                          child: Padding(
                            padding: EdgeInsets.all(paddingBig),
                            child: Text(
                              error,
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: paddingBig * 3),
                  Text(
                    tr('forgot_password_message'),
                    style: TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: paddingBig),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: tr('enter_phone_number'),
                      labelText: tr('phone_number'),
                    ),
                    validator: (value) =>
                        isValidPhone(value) ? null : tr('invalid_phone'),
                  ),
                  SizedBox(height: paddingBig),
                  SizedBox(
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: () {
                        _onFormSubmitted();
                      },
                      child: Text(tr('send')),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onFormSubmitted() {
    _bloc.add(SendCodeToPhone(phone: _phoneController.text));
  }

  void doneSendRequestDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          backgroundColor: Colors.green.shade600,
          title: Center(
            child: Text(
              tr('done_change_password'),
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
              SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    tr('Login'),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}

