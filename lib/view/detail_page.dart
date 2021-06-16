import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_deneme/model/sensor_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
class DetailPage extends StatefulWidget {
  String sensor;
  DetailPage(this.sensor);

  @override
  _DetailPageState createState() => _DetailPageState();
}

//günlük 480 tane
//haftalık 3360 tane
// aylık 13440 tane
class _DetailPageState extends State<DetailPage> {
    Future<Sensor> fetchSens;

    @override
  void initState() {
    super.initState();
    
  }
  @override

  Widget build(BuildContext context) {





    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return FutureBuilder<Sensor>(
      future: fetchSens ,
      builder: (context,snapshot){
        return Scaffold(appBar:AppBar() ,body: Column(children: [
        SfCartesianChart(
          series: <ChartSeries>[
            LineSeries()
          ],
        ),
        TextButton(
        child: Text(widget.sensor.toString()),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ],),);
      }
      
    );
  }
}
