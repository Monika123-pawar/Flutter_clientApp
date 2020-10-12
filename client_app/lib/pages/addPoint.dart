import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPoint extends StatefulWidget {
  @override
  _AddPointState createState() => _AddPointState();
}

class _AddPointState extends State<AddPoint> {
  TextEditingController taskController = TextEditingController();
  TextEditingController durationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Point"),
      ),
      body:  AlertDialog(
        title: Text('Add Point.'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Add new point',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Divider(
                          height: 5.0,
                          color: Colors.indigo,
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Add Requirement 1',
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Add Requirement 2',
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Add Requirement 3',
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
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
    );
  }
}
