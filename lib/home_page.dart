import 'package:flutter/material.dart';
import 'journey_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tracks index of currently selected tab
  final List<Widget> _children = []; // List of widgets we want to render

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accuride',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/homePage':
            return MaterialPageRoute(builder: (context) => HomePage());
            break;
          case '/journeyPage':
            return MaterialPageRoute(builder: (context) => JourneyPage());
            break;
        }
      },
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/circle-logo.png"),
              // Container used to adjust the size of the search bar child inside
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: SearchContainer()),
            ],
          ),

          //TODO: Routing to new page
          bottomNavigationBar: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.schedule), title: Text("")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.notification_important),
                    title: Text("")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.map), title: Text(""))
              ])),
    );
  }

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }
}

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
        child: Column(children: <Widget>[
          SearchBar(input: "Start"),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: const Text("")),
          SearchBar(input: "End"),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: const Text("")),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, '/journeyPage');
              }
            },
            child: Text('Go'),
          )
        ]));
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
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            prefixIcon: Icon(Icons.search),
            hintText: input),
        validator: (value) {
          if (value.isEmpty) {
            return "Station Name Required";
          }
          return null;
        });
  }
}
