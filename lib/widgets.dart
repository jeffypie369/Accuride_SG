import 'package:flutter/material.dart';

//  This file contains common widgets that can be used across different pages
//  of the application.

// SearchContainer contains SearchBars and a Button
class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() {
    return _SearchContainerState();
  }
}

class _SearchContainerState extends State<SearchContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Start"
                ),

                validator: (value) {
                  if (value.isEmpty) {
                    return "Station name required";
                  }
                  return null;
                }
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text("")
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "End"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Station name required";
                  }
                  return null;
                }
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text("")
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

//class SearchBar extends StatefulWidget {
//  final String input;
//
//  SearchBar({this.input});
//
//  @override
//  SearchBarState createState() => SearchBarState();
//}
//
//class SearchBarState extends State<SearchBar> {
//  @override
//  Widget build(BuildContext context) {
//    return TextFormField(
//      decoration: new InputDecoration(
//        border: OutlineInputBorder(
//          borderRadius: BorderRadius.all(Radius.circular(25.0))
//        ),
//        prefixIcon: Icon(Icons.search),
//        hintText: widget.input
//      ),
//      validator: (value) {
//        if (value.isEmpty) {
//        return "Station name required";
//      }
//      return null;
//    }
//    );
//  }
//}