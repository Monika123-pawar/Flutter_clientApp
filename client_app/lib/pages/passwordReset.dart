import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Builder(
            builder: (context) => ListView(

              children: <Widget> [

                // header text
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Reset Password', style: TextStyle(fontSize: 20)),
                ),

                // password input
                Padding(
                  padding: EdgeInsets.only(top: 48.0),
                  child: TextField(
                    obscureText: true,
                    // controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password',
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                // password input
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextField(
                    obscureText: true,
                    // controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repeat Password',
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                // submit button
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.indigo,
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Reset Password",style: TextStyle(fontSize: 20),),
                    ),
                  ),

                ),

              ],
            ),
            // ),
          ),
        ),
      ),
    );
      // GestureDetector(
      //
      // // close keyboard on outside input tap
      // onTap: () {
      //   FocusScope.of(context).requestFocus(FocusNode());
      // },


  }
}
