import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class CheckInternetConnectivity extends StatefulWidget {
  @override
  _CheckInternetConnectivityState createState() => _CheckInternetConnectivityState();
}

class _CheckInternetConnectivityState extends State<CheckInternetConnectivity> {
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetConnect(); // calls getconnect method to check which type if connection it

  }
  @override
  Widget build(BuildContext context) {
    return Container();
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
