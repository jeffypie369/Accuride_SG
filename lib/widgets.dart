import 'package:flutter/material.dart';

///  This file contains common widgets that can be used across different pages
///  of the application.

class SearchBar extends StatefulWidget {
  @override
  SearchBarState createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Station name required";
                    }
                    return null;
                  }
              ),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Station name required";
                    }
                    return null;
                  }
              ),
              RaisedButton(
                onPressed:() {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Go'),
              )
            ]
        )
    );
  }
}