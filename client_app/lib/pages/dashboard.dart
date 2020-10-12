import 'package:client_app/pages/project.dart';
import 'package:flutter/material.dart';

import 'ideas.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 300,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 150,
                      width: 190,
                      child: Card(
                        semanticContainer: true,
                       child:Column(
                         children: [
                           SizedBox(height: 10,),
                           Text("Project",style: TextStyle(fontSize: 15),),
                           SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text("phase 3",style: TextStyle(fontSize: 15),),
                           ),
                           FlatButton(
                             onPressed: (){
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context)=>Project())
                               );
                             },
                             textColor: Colors.indigo,
                             child: Text('see more',style: TextStyle(fontSize: 15),),
                           ),
                         ],
                       ),

                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 190,
                      child: Card(
                        semanticContainer: true,
                        child:Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("You Ideas",style: TextStyle(fontSize: 15),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Daft 1",style: TextStyle(fontSize: 15),),
                            ),
                            FlatButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>Ideas())
                                );
                              },
                              textColor: Colors.indigo,
                              child: Text('see more',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),

                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 150,
                      width: 190,
                      child: Card(
                        semanticContainer: true,
                        child:Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("Account",style: TextStyle(fontSize: 15),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("balance 3000",style: TextStyle(fontSize: 15),),
                            ),
                            FlatButton(
                              onPressed: (){
                                //forgot password screen
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context)=>PasswordReset())
                                // );
                              },
                              textColor: Colors.indigo,
                              child: Text('see more',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),

                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 190,
                      child: Card(
                        semanticContainer: true,
                        child:Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("Road Map",style: TextStyle(fontSize: 15),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("sprint 5",style: TextStyle(fontSize: 15),),
                            ),
                            FlatButton(
                              onPressed: (){
                                //forgot password screen
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context)=>PasswordReset())
                                // );
                              },
                              textColor: Colors.indigo,
                              child: Text('see more',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),

                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );

  }
}
