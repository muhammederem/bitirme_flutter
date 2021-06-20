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

    futureSensor = fetchSensor('http://159.65.115.118:8888/api/data/fstats/30');
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    return FutureBuilder<List<Sensor>>(
        future: futureSensor,
        builder: (context, snapshot) {
          var datas;
          List<Sensor> data = snapshot.data.toList();
          if (!snapshot.hasData) {
            return Scaffold(body: CircularProgressIndicator());
          } else {
            if (widget.sensor == "pm2_5") {
              datas = List.generate(30, (index) {
                return FlSpot(
                    index.toDouble(), double.parse(data[index].pm2_5));
              });
            } else if (widget.sensor == "co2") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].co2));
              });
            } else if (widget.sensor == "voc") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].voc));
              });
            } else if (widget.sensor == "temp") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].temp));
              });
            } else if (widget.sensor == "cho2") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].cho2));
              });
            } else if (widget.sensor == "co") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].co));
              });
            } else if (widget.sensor == "o3") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].o3));
              });
            } else if (widget.sensor == "no2") {
              datas = List.generate(30, (index) {
                return FlSpot(index.toDouble(), double.parse(data[index].no2));
              });
            } else if (widget.sensor == "humidity") {
              datas = List.generate(30, (index) {
                return FlSpot(
                    index.toDouble(), double.parse(data[index].humidity));
              });
            }

            SystemChrome.setEnabledSystemUIOverlays([]);
            return Scaffold(
              appBar: AppBar(title: Text(widget.sensor.toUpperCase()),),
              body: Container(
                
                padding: EdgeInsets.all(20),
                child: LineChart(
                  LineChartData(
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          show: true,
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
          }
        });
  }
}
