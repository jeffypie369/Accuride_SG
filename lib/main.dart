import 'package:flutter/material.dart';
import 'widgets.dart';

void main() => runApp(MyHomePage());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accuride',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/circle-logo.png"),
            // Container used to adjust the size of the search bar child inside
            Container(
              margin: const EdgeInsets.symmetric(horizontal:70.0),
              child: SearchContainer()
            )
          ]
        ),
        // BottomAppBar or BottomNavigationBar
      ),
    );
  }
}