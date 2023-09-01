import 'package:flutter/material.dart';
import 'package:udemy/Weather_forecast/convert_icon.dart';
import 'package:udemy/Weather_forecast/forecast_util.dart';
import 'package:udemy/Weather_forecast/weather_forecastModdel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  Widget midView( AsyncSnapshot<WeatherForecast> snapshot) {

    var forecastList = snapshot.data!.main;

    Container midView = Container(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${snapshot.data!.name}, ${snapshot.data!.sys!.country}",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.black87),
            ),
            Text("${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(snapshot.data!.dt!.toInt() * 1000))}",style: TextStyle(fontSize: 15)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: snapshot.data!.weather![0].main,size: 198,color: Colors.pinkAccent.shade200),
            ),
            //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.pinkAccent.shade200),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data!.main!.temp!.toStringAsFixed(0)} °F",style: TextStyle(fontSize: 34)),
                  SizedBox(width: 10),
                  Text("${snapshot.data!.weather![0].description!.toUpperCase()}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data!.wind!.speed!.toStringAsFixed(1)} min/hr"),
                        Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data!.main!.humidity!.toStringAsFixed(0)} %"),
                        Icon(FontAwesomeIcons.solidFaceGrinBeamSweat,size: 20,color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${snapshot.data!.main!.tempMax!.toStringAsFixed(0)} °F"),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown,)
                    ],
                  ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
    return midView;
  }