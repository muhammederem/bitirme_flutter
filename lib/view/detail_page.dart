import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Future<List<Sensor>> futureSensor;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    futureSensor =
        fetchSensor('http://159.65.115.118:8888/api/data/fstats/480');
  }

 

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return FutureBuilder<List<Sensor>>(
        future: futureSensor,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(body: CircularProgressIndicator());
          }
          List<Sensor> data = snapshot.data.toList();
          final List<FlSpot> datas = List.generate(480, (index) {
            return FlSpot(index.toDouble(), double.parse(data[index].cho2));
          });
          SystemChrome.setEnabledSystemUIOverlays([]);
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(20),
              child: LineChart(
                LineChartData(
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: datas,
                        isCurved: true,
                        barWidth: 1,
                        colors: [
                          Colors.red,
                        ],
                      ),
                    ]),
              ),
              // SfCartesianChart(
              //   series: <ChartSeries>[
              //     LineSeries(dataSource: data,
              //     xValueMapper: snapshot.data)
              //   ],
              // ),
              // TextButton(
              //   child: Text(widget.sensor.toString()),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ),
          );
        });
  }
}
