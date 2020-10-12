import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'dart:async';
import 'package:intl/intl.dart';



class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  TextEditingController taskController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body:  AlertDialog(
        title: Text('Add Tasks.'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add new task',
                  ),
                ),
              ),
        Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.indigo,
                  child: Text("Select Dates",style: TextStyle(fontSize: 20),),
                  onPressed: () async {
                    await displayDateRangePicker(context);
                  },
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}"),
                    Text("End Date: ${DateFormat('MM/dd/yyyy').format(_endDate).toString()}"),
                  ],
                ),
                SizedBox(height: 20,),
                // RaisedButton(
                //   child: Text("Continue"),
                //   onPressed: () {
                //     // widget.trip.startDate = _startDate;
                //     // widget.trip.endDate = _endDate;
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //       builder: (context) =>
                //     //           NewTripBudgetView(trip: widget.trip)),
                //     // );
                //   },
                // ),
              ],
            )
        ),
              // CalendarTimeline(
              //   initialDate: DateTime(2020, 2, 20),
              //   firstDate: DateTime(2020, 2, 15),
              //   lastDate: DateTime(2021, 11, 20),
              //   onDateSelected: (date) => print(date),
              //   leftMargin: 20,
              //   monthColor: Colors.white70,
              //   dayColor: Colors.teal[200],
              //   //dayNameColor: Color(0xFF333A47),
              //   activeDayColor: Colors.white,
              //   activeBackgroundDayColor: Colors.redAccent[100],
              //   dotsColor: Color(0xFF333A47),
              //   selectableDayPredicate: (date) => date.day != 23,
              // ),
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
                  // widget.trip.startDate = _startDate;
                  // widget.trip.endDate = _endDate;
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