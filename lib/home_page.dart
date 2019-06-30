import 'package:flutter/material.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;  // Tracks index of currently selected tab
  final List<Widget> _children = [];  // List of widgets we want to render

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
            ),
          ],
        ),

        //TODO: Routing to new page
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.schedule),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.notification_important),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: Text("")
            )
          ]
        )
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }
}
