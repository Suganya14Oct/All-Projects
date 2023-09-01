import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy/Weather_forecast/convert_icon.dart';
import 'package:udemy/Weather_forecast/forecast_util.dart';
import 'package:udemy/Weather_forecast/weather_forecastModdel.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {

  List a = ["Day1","Day2","Day3","Day4","Day5","Day6","Day7"];

  List b = [Icon(FontAwesomeIcons.sun,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.cloud,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.sun,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.cloud,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.cloudRain,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.snowman,color: Colors.pinkAccent, size: 45,),
    Icon(FontAwesomeIcons.snowman,color: Colors.pinkAccent, size: 45,),
  ];

  var forecastList = snapshot.data!.dt;
  var dayofWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayofWeek = fullDate.split(",")[0];

  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(a[index]),
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: b[index]
                //child: getWeatherIcon(weatherDescription: snapshot.data!.weather![0].main,color: Colors.pinkAccent,size: 45),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("${snapshot.data!.main!.tempMin!.toStringAsFixed(0)} °F",style: TextStyle(fontSize: 12),),
                    ),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("${snapshot.data!.main!.tempMax!.toStringAsFixed(0)} °F",style: TextStyle(fontSize: 12),),
                    ),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Hum:${snapshot.data!.main!.humidity!.toStringAsFixed(0)} %",style: TextStyle(fontSize: 10),),
                    ),
                    Icon(FontAwesomeIcons.solidFaceGrinBeamSweat,color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("win:${snapshot.data!.wind!.speed!.toStringAsFixed(0)} m/h",style: TextStyle(fontSize: 10),),
                    ),
                    Icon(FontAwesomeIcons.solidFaceGrinBeamSweat,color: Colors.white,size: 17,)
                  ],
                )
              ],
            )
          ],
        ),
      ],
    ),
  );

}