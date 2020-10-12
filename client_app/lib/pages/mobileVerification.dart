
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MobileVerification extends StatefulWidget {
  @override
  _MobileVerificationState createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  String phoneNumber;
  String smsCode;
  String verificationCode;

  // Future<void> _submit() async {
  //   final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
  //     this.verificationCode = verId;
  //   };
  //
  //   final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
  //     this.verificationCode = verId;
  //     smsCodeDialog(context).then((value) => print("Signed In"));
  //   };
  //
  //   final PhoneVerificationCompleted phoneVerificationCompleted = (
  //       FirebaseUser user) {
  //     print("Success");
  //   };
  //
  //   final PhoneVerificationFailed phoneVerificationFailed = (
  //       AuthException exception) {
  //     print("${exception.message}");
  //   };
  //
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: this.phoneNumber,
  //       timeout: const Duration(seconds: 5),
  //       verificationCompleted: phoneVerificationCompleted,
  //       verificationFailed: phoneVerificationFailed,
  //       codeSent: phoneCodeSent,
  //       codeAutoRetrievalTimeout: autoRetrievalTimeout
  //   );
  // }
  //
  // Future<bool> smsCodeDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Enter Code"),
  //           content: TextField(
  //             onChanged: (value) {
  //               this.smsCode = value;
  //             },
  //           ),
  //           contentPadding: EdgeInsets.all(10.0),
  //           actions: <Widget>[
  //             // FlatButton(
  //             //   child: Text("Verify"),
  //             //   onPressed: (){
  //             //     FirebaseAuth.instance.currentUser().then((user) {
  //             //       if(user != null) {
  //             //         Navigator.of(context).pop();
  //             //         // Navigator.of(context).pushReplacementNamed('/homepage');
  //             //       } else {
  //             //         Navigator.of(context).pop();
  //             //         signIn();
  //             //       }
  //             //     });
  //             //   },
  //             // )
  //           ],
  //         );
  //       }
  //   );
  // }

  // signIn() {
  //   FirebaseAuth.instance.signInWithPhoneNumber(verificationId: verificationCode, smsCode: smsCode)
  //       .then((user) => Navigator.of(context).pushReplacementNamed('/homepage'))
  //       .catchError((e) => print(e));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mobile Verification"),
        ),
        // body: Container(
        //   child: Column(
        //     children: [
        //       Text(
        //         "Verify Your Phone Number",
        //         style: TextStyle(fontSize: 25),
        //       ),
        //       Card(
        //         elevation: 7,
        //         child: Column(
        //           children: [
        //             TextField(
        //               decoration:
        //                   new InputDecoration(labelText: "Phone Number"),
        //               keyboardType: TextInputType.number,
        //               inputFormatters: <TextInputFormatter>[
        //                 FilteringTextInputFormatter.digitsOnly
        //               ], // Only numbers can be entered
        //             ),
        //             SizedBox(height: 12.0),
        //             ButtonBar(
        //               alignment: MainAxisAlignment.center,
        //               children: [
        //                 RaisedButton(
        //                   textColor: const Color(0xFF6200EE),
        //                   onPressed: () {
        //                     // Perform save profile
        //                   },
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(15.0),
        //                     child: const Text('Verify',style: TextStyle(fontSize: 20),),
        //                   ),
        //                 ),
        //
        //               ],
        //             ),
        //             ListTile(
        //               leading: Icon(Icons.phone),
        //               title: TextField(
        //                 decoration: InputDecoration(
        //                     labelText: "Phone Number"
        //                 ),
        //                 keyboardType: TextInputType.phone,
        //                 // onChanged: (value) => phoneNumber = value,
        //               ),
        //             ),
        //             Row(
        //               children: <Widget>[
        //                 Expanded(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        //                     child: RaisedButton(
        //                       // onPressed: _submit,
        //                       child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
        //                       color: Color(0xFF18D191),
        //                       elevation: 7.0,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // )
      body: Center(
        child: Card(
          elevation: 7,
          child: Column(
            children: <Widget>[
              _phoneForm(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
                        color: Colors.indigo,
                        elevation: 7.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _phoneForm() {
  return ListTile(
    leading: Icon(Icons.phone),
    title: TextField(
      decoration: InputDecoration(
          labelText: "Phone Number"
      ),
      keyboardType: TextInputType.phone,
      // onChanged: (value) => phoneNumber = value,
    ),
  );
}


