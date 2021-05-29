import 'package:flutter/material.dart';
import 'package:flutter_deneme/view/prev_page.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static String sensor = "";
  static Color color = Colors.pink;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    PreviewPage(sensor ),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor),
    PreviewPage(sensor,),
    PreviewPage(sensor)
  ];

  List<Color> colorsx = [
    Color(0xfffdcbdc),
    Color(0xffb8e3fa),
    Color(0xffe8fc6c),
    Color(0xffb2fba0),
    Color(0xffc6d1f9),
    Color(0xffe8fc6c),
    Color(0xfffdcbdc),
    Color(0xffb8e3fa),
    Color(0xffe8fc6c),
    Color(0xffb2fba0),
  ];
  List<String> sensors = [
    "Co2",
    "O3",
    "C12H6",
    "Humadity",
    "Temp",
    "CNaH",
    "Falan",
    "Filan",
    "Deneme",
    "Last"
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: 'İki',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '3',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: '4',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '5',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: '6',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '7',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: '8',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '9',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: '10',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            sensor = sensors[index];
            color = colorsx[index];
          });
        },
      ),
    );
  }
}
