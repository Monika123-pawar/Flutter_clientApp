import 'package:flutter/material.dart';

class TalkToUs extends StatefulWidget {
  @override
  _TalkToUsState createState() => _TalkToUsState();
}

class _TalkToUsState extends State<TalkToUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk To Us"),
      ),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0),
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_balance,size: 80.0,color: Colors.indigo),
                        SizedBox(width: 50,),
                        new Text("Account", style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_box,size: 80.0,color: Colors.indigo),
                        SizedBox(width: 50,),
                        new Text(
                            "Project",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.message,size: 80.0,color: Colors.indigo),
                        SizedBox(width: 50,),
                        new Text(
                            "Social Media",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.question_answer,size: 80.0,color: Colors.indigo),
                        SizedBox(width: 50,),
                        new Text(
                            "Enquiry",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.business,size: 80.0,color: Colors.indigo),
                        SizedBox(width: 50,),
                        new Text("Business Help", style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.devices_other,size: 80.0,color: Colors.indigo,),
                        SizedBox(width: 50,),
                        new Text("Other", style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


