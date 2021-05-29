import 'package:flutter/material.dart';
import 'package:flutter_deneme/model/sensor.dart';

class DetailPage extends StatefulWidget {
  Sensor sensor = new Sensor();
  DetailPage(this.sensor);
  

  @override
  _DetailPageState createState() => _DetailPageState(sensor);
}

class _DetailPageState extends State<DetailPage> {
   Sensor sensor;
  _DetailPageState(this.sensor);
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.greenAccent,
       child: TextButton(child: Text(sensor.cho2.toString()),onPressed: (){
         Navigator.pop(context);
       },),
    );
  }
}