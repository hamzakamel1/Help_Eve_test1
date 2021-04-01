import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:hatilaqi/ui/help_widget.dart';
import 'package:hatilaqi/utils/validation.dart';

class SheetNewPassword extends StatefulWidget {
  final ForgotPasswordBloc bloc;

  const SheetNewPassword({Key key, this.bloc}) : super(key: key);

  @override
  _SheetNewPasswordState createState() => _SheetNewPasswordState();
}

class _SheetNewPasswordState extends State<SheetNewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      // BlocListener(
      // cubit: widget.bloc,
      // listener: (context,state) {
      //   if (state is ChangePasswordSuccess) {
      //     Navigator.of(context).pop();
      //   }
      // },
      // child:
      Card(
        margin: EdgeInsets.only(right: marginMin, left: marginMin),
        shape: cardRoundedTop,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(marginMin),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          tr('edit_password'),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  SizedBox(height: marginMin),
                  TextFormField(
                    controller: newPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: tr('enter_new_password'),
                      labelText: tr('new_password'),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      return isValidPassword(value) &&
                              value == confirmNewPasswordController.text
                          ? null
                          : tr('invalid_password');
                    },
                  ),
                  SizedBox(height: marginMin),
                  TextFormField(
                    controller: confirmNewPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: tr('enter_confirm_password'),
                      labelText: tr('confirm_password'),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      return isValidPassword(value) &&
                              value == newPasswordController.text
                          ? null
                          : tr('invalid_password');
                    },
                  ),
                  SizedBox(height: marginMin),
                  SizedBox(
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          widget.bloc.add(
                            ForgotChangePassword(
                              password:  confirmNewPasswordController.text,
                            ),
                          );
                        }
                      },
                      child: Text(tr('edit')),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    // ,
    // );
  }
}
