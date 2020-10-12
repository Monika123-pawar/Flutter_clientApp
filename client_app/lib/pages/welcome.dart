import 'dart:async';

import 'package:client_app/pages/Register.dart';
import 'package:client_app/pages/clipper.dart';
import 'package:client_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;

  @override
  void initState() {
    super.initState();
    GetConnect(); // calls getconnect method to check which type if connection it


  }

  callLogin(){
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              color: Colors.indigo,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 150)),
       body:isInternetOn
        ? iswificonnected ?  Container(
             child: Column(
           children: [
             Align(
                 alignment: Alignment.topCenter,
                 child: Image.asset(
                   "logo.png",
                   width: 400,
                   height: 250,
                 )),
           ],
         )) : callLogin()
        : buildAlertDialog(),

      // Container(
      //     child: Column(
      //   children: [
      //     Align(
      //         alignment: Alignment.topCenter,
      //         child: Image.asset(
      //           "logo.png",
      //           width: 400,
      //           height: 250,
      //         )),
      //   ],
      // )),
    );
  }
  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
  Center ShowWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              " Your are connected to ${iswificonnected ? "WIFI" : "MOBILE DATA"}"),
          // Text(iswificonnected ? "$wifiBSSID" : "Not Wifi"),
          // Text("$wifiIP"),
          // Text("$wifiName")
        ],
      ),
    );
  }
  Center ShowMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }
  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {

      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {

      iswificonnected = true;
      setState(() async {
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
      });

    }
  }
}
