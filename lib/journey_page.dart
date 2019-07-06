import 'package:flutter/material.dart';

class JourneyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JourneyPageState();
  }
}

class _JourneyPageState extends State<JourneyPage> {
  int _currentIndex = 0; // Tracks index of currently selected tab
  final List<Widget> _children = []; // List of widgets we want to render

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accuride',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Accuride')),
          body: Column(
            children: <Widget>[
              // Container used to adjust the size of the search bar child inside
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      color: Colors.black,
                      icon:Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)
                    ),
                  ]
                )
              )
            ],
          ),

          //TODO: Routing to new page
          bottomNavigationBar:
              BottomNavigationBar(currentIndex: _currentIndex, items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.schedule), title: Text("")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.notification_important), title: Text("")),
            BottomNavigationBarItem(icon: new Icon(Icons.map), title: Text(""))
          ])),
    );
  }
}
