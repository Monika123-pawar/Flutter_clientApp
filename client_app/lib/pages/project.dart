import 'package:client_app/pages/addTask.dart';
import 'package:client_app/pages/projectChatBot.dart';
import 'package:client_app/pages/projectDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_app/model/global.dart'as config;

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {

  var data;
  var dataId;
  Object info;

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

  //  createAlertDialog(BuildContext context) {
  //   TextEditingController customController = TextEditingController();
  //
  //   return showDialog(context: context ,builder: (context)) async {
  //     return AlertDialog(
  //       title: Text("name"),
  //       content: TextField(
  //         controller: customController,
  //       ),
  //       actions: [
  //         MaterialButton(
  //           elevation: 5.0,
  //           child: Text("submit"),
  //           onPressed: () {
  //             Navigator.of(context).pop(customController.text.toString());
  //           },
  //         ),
  //       ],
  //     );
  //    };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project"),
      ),
      body:new FutureBuilder(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      "Project List",
                      style: TextStyle(
                          fontSize: 30,
                          // backgroundColor: Colors.indigo,
                          color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    child: data != null
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 400,
                            width: 220,
                            child: Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Project" +
                                        "${dataId = data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "This project is about" +
                                        " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Tasks completed " +
                                        " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Total Tasks " +
                                        " ${data[index]["id"]} "
                                            "",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Status " + " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text(
                                      'View Details',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProjectDetails(
                                                    dataId: data[index]["id"])),
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text(
                                      'Add Task',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AddTask()));
                                    },
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text(
                                      'Get Connected',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProjectChatBot()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    )
                        : Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddProject()));
        },
        child: Icon(Icons.add, color: Colors.black,),
        foregroundColor: Colors.indigo,
      ),
    );
  }
}

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  // controller: taskController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add New Project Title',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.indigo,
                child: Text(
                  'Add Task',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddTask()));
                },
              ),
              SizedBox(height: 40,),
              Divider(
                height: 10.0,
                color: Colors.indigo,
              ),
              SizedBox(height: 20,),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.indigo,
                    child: Text('Save', style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           NewTripBudgetView(trip: widget.trip)),
                      // );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
