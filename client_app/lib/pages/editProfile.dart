import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Edit Profile"),
      ),
          body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Username',
                    ),
                  ),

                  SizedBox(height: 12.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Email',
                    ),
                  ),

                  SizedBox(height: 12.0),
                  TextField(
                    decoration: new InputDecoration(labelText: "Enter your number"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                  SizedBox(height: 12.0),
                  Text("SociaL Media",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 12.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Facebook',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Twitter',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Instagram',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Personal Information",style: TextStyle(fontSize: 20),),
                  ),
                  TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      hintText: "Ex. Insert your dob",),
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));

                      dateCtl.text = date.toIso8601String();},),
                  SizedBox(height: 12.0),
                  TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Anniversary",
                      hintText: "Ex. Insert your Anniversary date",),
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));

                      dateCtl.text = date.toIso8601String();},),
                  SizedBox(height: 12.0),
                  TextField(
                    maxLines: 4,
                    // decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Address',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Official Information",style: TextStyle(fontSize: 20),),
                  ),
                  TextField(
                    decoration: new InputDecoration(labelText: "Contact"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                  SizedBox(height: 12.0),
                  TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Anniversary",
                      hintText: "Ex. Insert your Anniversary date",),
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));

                      dateCtl.text = date.toIso8601String();},),
                  SizedBox(height: 12.0),
                  TextField(
                    maxLines: 4,
                    // decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Address',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                          // Perform save profile
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Text('Save',style: TextStyle(fontSize: 20),),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

    );
  }
}
