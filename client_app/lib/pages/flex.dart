import 'package:flutter/material.dart';

class Flexb extends StatefulWidget {
  @override
  _FlexbState createState() => _FlexbState();
}

class _FlexbState extends State<Flexb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 500,
      child: Card(
        elevation: 5,
        child: ListView(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Container(
              child: new Row(
                children: <Widget>[
                  new Expanded (
                    flex:1,
                    child : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.account_balance,size: 70.0,color: Colors.indigo),
                          SizedBox(height: 10,),
                          new Text("Account")
                        ],
                      ),
                    ),),
                  new Expanded(
                    flex :1,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.account_box,size: 70.0,color: Colors.indigo),
                              SizedBox(height: 10,),
                              new Text(
                                  "Project"
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),),
                  new Expanded(
                    flex :1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.account_box,size: 70.0,color: Colors.indigo),
                          SizedBox(height: 10,),
                          new Text(
                              "SM"
                          ),
                        ],
                      ),
                    ),),
                  new Expanded(
                    flex :1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.question_answer,size: 70.0,color: Colors.indigo),
                          SizedBox(height: 10,),
                          new Text(
                              "Enquiry"
                          ),
                        ],
                      ),
                    ),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
