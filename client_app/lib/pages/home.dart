import 'package:client_app/pages/ErrorMsg.dart';
import 'package:client_app/pages/actionsPending.dart';
import 'package:client_app/pages/editProfile.dart';
import 'package:client_app/pages/mobileVerification.dart';
import 'package:client_app/pages/notification.dart';
import 'package:client_app/pages/talkToUs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkInternetConnectivity.dart';
import 'dashboard.dart';
import 'actionsPending.dart';
import 'flex.dart';
import 'talkToUs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  ScrollController _scrollController;
  bool _isOnTop = true;


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
    // CheckInternetConnectivity();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("WebEmps \n Building your imagination",style:GoogleFonts.lato(fontStyle: FontStyle.italic)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationPage()),
                  );
                })
          ),
        ],
      ),
      body:isInternetOn
          ?  GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MobileVerification()),
          );
        },
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          children: [
            // _phoneVerification(),
            DashBoard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Talk To US",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.arrow_right,size: 40,), onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TalkToUs()),
                      );
                    })
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Flexb(),
            // TalkToUs(),
            ActionsPending(),
            // Card(
            //   elevation: 5,
            //   child: ListView(
            //     // scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: [
            //       Container(
            //         child: new Row(
            //           children: <Widget>[
            //             new Expanded (
            //               flex:1,
            //               child : Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Icon(Icons.account_balance,size: 70.0,color: Colors.indigo),
            //                     SizedBox(height: 10,),
            //                     new Text("Account")
            //                   ],
            //                 ),
            //               ),),
            //             new Expanded(
            //               flex :1,
            //               child: Column(
            //                 children: <Widget>[
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Column(
            //                       children: [
            //                         Icon(Icons.account_box,size: 70.0,color: Colors.indigo),
            //                         SizedBox(height: 10,),
            //                         new Text(
            //                             "Project"
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),),
            //             new Expanded(
            //               flex :1,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Icon(Icons.account_box,size: 70.0,color: Colors.indigo),
            //                     SizedBox(height: 10,),
            //                     new Text(
            //                         "SM"
            //                     ),
            //                   ],
            //                 ),
            //               ),),
            //             new Expanded(
            //               flex :1,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Icon(Icons.question_answer,size: 70.0,color: Colors.indigo),
            //                     SizedBox(height: 10,),
            //                     new Text(
            //                         "Enquiry"
            //                     ),
            //                   ],
            //                 ),
            //               ),),
            //
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

          ],

        ),
      )
          : buildAlertDialog(),

        floatingActionButton: FloatingActionButton(
          onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
          child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
        ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Monika Pawar",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                "pawarmonika575@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                // backgroundImage: NetworkImage(
                //     'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1529626455594-4ff0802cfb7e%3Fixlib%3Drb-1.2.1%26ixid%3DeyJhcHBfaWQiOjEyMDd9%26w%3D1000%26q%3D80&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fgirl&tbnid=5xP16CqrbSxUfM&vet=12ahUKEwj0_vG9zPfrAhUUNisKHTlHCKEQMygdegUIARCNAg..i&docid=m-AVDW2XsN9SpM&w=1000&h=1500&q=girls&ved=2ahUKEwj0_vG9zPfrAhUUNisKHTlHCKEQMygdegUIARCNAg'),
              ),
            ),
            ListTile(
              title: Text(
                "Personal",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile()),
                    );
              },
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Project",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Account",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Your Ideas",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Road Map",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
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


