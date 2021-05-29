
import 'package:flutter/material.dart';
import 'package:flutter_deneme/model/sensor.dart';
import 'package:flutter_deneme/view/detail_page.dart';
import 'package:http/http.dart' as http;

class PreviewPage extends StatefulWidget {
  String sensor_name;

  PreviewPage(this.sensor_name);

  @override
  _PreviewPageState createState() => _PreviewPageState(sensor_name);
}

class _PreviewPageState extends State<PreviewPage> {
   String sensor_name;
  List<String> sensors = [
"cho2",
  "co" ,
  "co2", 
  "humidity",
  "no2", 
  "o3",
  "pm10", 
  "pm1_0",
  "pm2_5",
  "temprature",
  "time", 
  "voc"
  ];
  Sensor sensor;
  Uri myUri = Uri.parse("http://159.65.115.118/api/data");

  _PreviewPageState(this.sensor_name);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSensor(myUri),
      builder:(context,snapshot){
        if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ?
            Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn.wallpapersafari.com/55/58/Mt3QVP.gif"),
              fit: BoxFit.cover,
            ),
          ),
      
          child: Container(
            color: Colors.transparent,
              child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6)),
              // CircularUsageIndicator(
              //   elevation: 15.0,
              //   backgroundColor: Colors.blueAccent,
              //   borderColor: Colors.transparent,
              //   progressValue: snapshot.data.last.sensor_name, // progress value from 0.0 to 1.0
              //   progressLabelStyle: TextStyle(
              //     // change style for percentage text.
              //     fontSize: 60.0,
              //     color: Colors.transparent,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   progressColor: Color(0xFF023A5C),
              //   size: 300,
              //   borderWidth: 1.0,
              //   // comment children if you the percentage to show up as a label
              //   children: [
              //     // if there are children widgets then the percentage label will not show up
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.baseline,
              //       textBaseline: TextBaseline.alphabetic,
              //       children: [
              //         Text(
              //           sensor_name,
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 50.0,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Text(
              //       sensor_name,
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 25.0,
              //       ),
              //     ),
              //   ],
              // ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage(sensor)));
                },
                child: Text(
                  sensor_name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )))
    :Container(child: CircularProgressIndicator() );}
      
           
  );
  }
}
