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
            SearchBar(input:"Start"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: const Text("")
            ),
            SearchBar(input: "End"),
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

// SearchBar for SearchContainer
class SearchBar extends StatelessWidget {
  SearchBar({Key key, this.input}) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
        prefixIcon: Icon(Icons.search),
        hintText: input
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Station Name Required";
        }
        return null;
      }
    );
  }
}