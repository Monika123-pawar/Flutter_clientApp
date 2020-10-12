import 'package:client_app/pages/addPoint.dart';
import 'package:client_app/pages/addTask.dart';
import 'package:client_app/pages/ideasDetails.dart';
import 'package:client_app/pages/projectChatBot.dart';
import 'package:client_app/pages/projectDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_app/model/global.dart' as config;

class Ideas extends StatefulWidget {
  @override
  _IdeasState createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  ScrollController _scrollController;
  bool _isOnTop = true;

  var data;
  var dataId;
  Object info;

  @override
  void initState() {
    super.initState();
    getData();
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
        title: Text("Ideas"),
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
              controller: _scrollController,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      "Idea List",
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
                                    "Idea" + "${dataId=data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "I can do this.." +
                                        " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Ideat my concept " +
                                        " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Requirements " + " ${data[index]["id"]} "
                                        "",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Clarity" + " ${data[index]["id"]} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text('View Details', style: TextStyle(fontSize: 20),),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)=>IdeasDetails(dataId:data[index]["id"])),
                                      );
                                    },
                                  ),                                      RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text('Add Point', style: TextStyle(fontSize: 20),),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=>AddPoint())
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.indigo,
                                    child: Text('Get Connected', style: TextStyle(fontSize: 20),),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=>ProjectChatBot())
                                      );
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
                      AddIdea()));
        },
        child: Icon(Icons.add, color: Colors.black,),
        foregroundColor: Colors.indigo,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
      //   child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
      // ),
    );
  }
}

class AddIdea extends StatefulWidget {
  @override
  _AddIdeaState createState() => _AddIdeaState();
}

class _AddIdeaState extends State<AddIdea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Idea"),
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
                    labelText: 'Add New Idea Title',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.indigo,
                child: Text(
                  'Add Point',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPoint()));
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
