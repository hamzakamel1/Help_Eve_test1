import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:hatilaqi/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:hatilaqi/ui/help_widget.dart';

class TermsConditionPage extends StatefulWidget {
  final SendCodeSuccess state ;
  final ForgotPasswordBloc bloc ;
  TermsConditionPage({Key key, this.state, this.bloc, }) : super(key: key);

  @override
  _TermsConditionPageState createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocListener(
        cubit: widget.bloc,
        listener: (context,state) {

        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Image.asset('assets/images/verify.png',height: 400,),

              widget.state.error != null
                  ? Card(
                child: Padding(
                  padding: EdgeInsets.all(paddingBig),
                  child: Text(
                    widget.state.error ,
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
                  : SizedBox(),

              Text(
                localization.tr('enter_code'),
                style: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: marginMin),
              Text(
                widget.state.phone,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: marginMin),
              Center(
                child: Container(
                  height: 100.0,
                  child: GestureDetector(
                    // onLongPress: () {
                    //   print("LONG");
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           content:
                    //               Text("Paste clipboard stuff into the pinbox?"),
                    //           actions: <Widget>[
                    //             FlatButton(
                    //                 onPressed: () async {
                    //                   var copiedText =
                    //                       await Clipboard.getData("text/plain");
                    //                   if (copiedText.text.isNotEmpty) {
                    //                     controller.text = copiedText.text;
                    //                   }
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: Text("YES")),
                    //             FlatButton(
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: Text("No"))
                    //           ],
                    //         );
                    //       });
                    // },
                    child: PinCodeTextField(
                      autofocus: true,
                      controller: controller,
                      hideCharacter: false,
                      highlight: true,
                      highlightColor: Colors.blue,
                      defaultBorderColor: Colors.black,
                      hasTextBorderColor: Colors.green,
                      maxLength: pinLength,
                      hasError: hasError,
                      onTextChanged: (text) {
                        setState(() {
                          hasError = false;
                        });
                      },
                      onDone: (text) {
                        print("DONE $text");
                        print("DONE CONTROLLER ${controller.text}");
                        widget.bloc.add(ValidateCode(code: controller.text));
                      },
                      pinBoxWidth: 50,
                      pinBoxHeight: 64,
                      hasUnderline: true,
                      wrapAlignment: WrapAlignment.spaceAround,
                      pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                      pinTextStyle: TextStyle(fontSize: 22.0),
                      pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                      pinTextAnimatedSwitcherDuration:
                      Duration(milliseconds: 300),
//                    highlightAnimation: true,
                      highlightAnimationBeginColor: Colors.black,
                      highlightAnimationEndColor: Colors.white12,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              Visibility(
                child: Text(
                  localization.tr("Wrong PIN!"),
                ),
                visible: hasError,
              ),
              SizedBox(
                width: 150,
                child: RaisedButton(
                  onPressed: () {
                    widget.bloc.add(ValidateCode(code: controller.text));
                  },
                  child: Text(
                    localization.tr('send'),
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
