
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

// Future<List<Sensor>> fetchSensor() async {
//   final response =
//       await http.get(Uri.parse('http://159.65.115.118:8888/api/data/fstats/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Sensor.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }


class Sensor {

  final String pm1_0,pm2_5,pm10,co2,voc,temp,humidity,cho2,co,o3,no2;
  final String time;

  Sensor({
 this.pm1_0,  this.pm2_5,  this.pm10,  this.co2, this.voc, this.temp, this.humidity, this.cho2, this.co, this.o3, this.no2, this.time
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
        pm1_0: json['PM1_0'] ,
        pm2_5: json['PM2_5'] ,
        pm10: json['PM10'] ,
        co2: json['C02'] ,
        voc: json['VOC'] ,
        temp: json['TEMP'] ,
        humidity: json['HUM'] ,
        cho2: json['CHO2'] ,
        co: json['CO'] ,
        o3: json['O3'] ,
        no2: json['NO2'] ,
        time: json['time']);
  }
}



Future<List<Sensor>> fetchSensor( String link) async {
  final response = await http.get(
      link);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseSensor, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Sensor> parseSensor(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Sensor>((json) => Sensor.fromJson(json)).toList();
}
