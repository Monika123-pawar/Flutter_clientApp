import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_app/model/global.dart'as config;


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  ScrollController _scrollController;
  bool _isOnTop = true;

  var data;
  var dataId;


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
      appBar:AppBar(
        title:Text("Notification"),
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
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: data != null?
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title:Text("${data[index]["id"]}: "+data[index]["title"]) ,
                                // subtitle: Text("Id:${data[index]["id"]}"),
                                leading: Icon(Icons.call_to_action),
                                onTap: (){
                                  // Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context)=>())
                                  //     );
                                },
                              ),
                            ),
                          );
                      },
                      itemCount:data.length ,
                    ):
                    Center(child: CircularProgressIndicator(),)

                ),
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
        onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
        child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
      ),
    );
  }
}
