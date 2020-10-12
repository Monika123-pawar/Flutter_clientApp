import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_app/model/global.dart'as config;

class ActionsPending extends StatefulWidget {
  @override
  _ActionsPendingState createState() => _ActionsPendingState();
}

class _ActionsPendingState extends State<ActionsPending> {
  var url="https://jsonplaceholder.typicode.com/posts";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

 Future<String> getData() async{
    try {
      var res = await http.get(config.domainName);
      data = jsonDecode(res.body);
      // print(data);
      setState(() {});
    }
    catch(e){
      print(e);
      throw ("Something went wrong. Please check again");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Action Pending",style: TextStyle(fontSize: 20,backgroundColor: Colors.indigo,color: Colors.white),textAlign:TextAlign.start ,),
        ),
        Container(

          child: data != null?
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context,index){
              return
                Padding(
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
                );
            },
            itemCount:data.length ,
          ):
          Center(child: CircularProgressIndicator(),),
        ),
      ],
    );
  }

}

