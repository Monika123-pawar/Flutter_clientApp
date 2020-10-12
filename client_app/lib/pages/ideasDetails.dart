import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_app/model/global.dart'as config;


class IdeasDetails extends StatefulWidget {
  var dataId = 1;
  Object info = [];
  IdeasDetails({this.dataId, this.info});

  @override
  _IdeasDetailsState createState() => _IdeasDetailsState(dataId, info);
}

class _IdeasDetailsState extends State<IdeasDetails> {
  String dropdownValueOne = 'One';
  String dropdownValueTwo = 'One';
  String title;
  var dataId = 1;
  Object info;
  _IdeasDetailsState(var dataId, Object info) : dataId = dataId;

  var taskData;
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    try {
      var res = await http.get(config.domainName);
      if(res.statusCode==200) {
        return data = jsonDecode(res.body);
        setState(() {});
      }
    }
    catch(e){
      throw ("Something went wrong. Please check again");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ideas${dataId}"),
      ),
      body: new FutureBuilder(
        future: getData(),
        initialData: "Fetching Data",
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Text("Fetching Data"),
            );
          }
          if (snapshot.hasData) {
            var data = snapshot.data;
            return new SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Ideas ${dataId}",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "I can do this:-" +
                                    (data[dataId - 1]["title"]),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Points" + " 200",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Requiremets" + " 100",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20.0),
                                child: Card(
                                  elevation: 5,
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black),
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('New"'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Daft'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Row'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Final'),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('20'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('14'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('7'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('159'),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed: () {}),
                                        Spacer(),
                                        DropdownButton<String>(
                                          value: dropdownValueOne,
                                          icon: Icon(Icons.arrow_right),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValueOne = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'One',
                                            'Two',
                                            'Free',
                                            'Four'
                                          ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                        ),
                                        Spacer(),
                                        DropdownButton<String>(
                                          value: dropdownValueTwo,
                                          icon: Icon(Icons.arrow_right),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValueTwo = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'One',
                                            'Two',
                                            'Free',
                                            'Four'
                                          ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Point ",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString(),style:TextStyle(fontSize: 30),);
          }
          return Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
