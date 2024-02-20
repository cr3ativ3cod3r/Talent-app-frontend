import 'package:flutter/material.dart';

TextEditingController locationController = TextEditingController();
TextEditingController _textFieldController = TextEditingController();
var enteredLocation = "";

displayDialog(BuildContext context, Function(String) onLocationSubmitted) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('LOCATION'),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(hintText: "Enter your locations"),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('SUBMIT'),
            onPressed: () {
              enteredLocation = _textFieldController.text;
              onLocationSubmitted(enteredLocation); // Call the callback function with the entered location
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
