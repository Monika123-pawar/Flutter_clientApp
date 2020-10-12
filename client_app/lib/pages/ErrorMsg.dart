import 'package:flutter/material.dart';

class ErrorMsg extends StatefulWidget {
  String errorMsg;
ErrorMsg(String error){
  this.errorMsg=error;
}

  @override
  _ErrorMsgState createState() => _ErrorMsgState(this.errorMsg);
}

class _ErrorMsgState extends State<ErrorMsg>{
  _ErrorMsgState(String errorMsg);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("hi"),
      ),
    );
  }
}
