import 'package:flutter/material.dart';
import 'package:flutter_deneme/view/prev_page.dart';

class RoomSettingsChooserPage extends StatefulWidget {
  RoomSettingsChooserPage({Key key}) : super(key: key);

  @override
  _RoomSettingsChooserPageState createState() =>
      _RoomSettingsChooserPageState();
}

class _RoomSettingsChooserPageState extends State<RoomSettingsChooserPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _index;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 10, vsync: this);
    _index = 0;
  }

  List<String> sensors = [
    "1",
    "2",
    "3",
    "1",
    "2",
    "3",
    "1",
    "2",
    "3",
    "1",
  ];
  List<Color> colors = [
    Colors.white,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.white,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.white,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: new AppBar(
          toolbarHeight: 48,
          bottom: new TabBar(isScrollable: true,controller: _controller, tabs: <Tab>[
            new Tab(text: "NEW"),
            new Tab(text: "HOTELS"),
            new Tab(text: "FOOD"),
            new Tab(text: "FUN"),
            new Tab(text: "NEW"),
            new Tab(text: "HOTELS"),
            new Tab(text: "FOOD"),
            new Tab(text: "FUN"),
            new Tab(text: "NEW"),
            new Tab(text: "HOTELS"),
          ]),
        ),
        body: new TabBarView(

          controller: _controller,
          children: <Widget>[
            PreviewPage(sensors[1]),
            PreviewPage(sensors[2]),
            PreviewPage(sensors[1]),
            PreviewPage(sensors[2]),
            PreviewPage(sensors[1]),
            PreviewPage(sensors[2]),
            PreviewPage(sensors[1]),
            PreviewPage(sensors[1]),
            PreviewPage(sensors[2]),
            PreviewPage(sensors[2]),
          ],
        ),
      )
    );
  }
}
