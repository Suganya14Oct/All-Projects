import 'package:flutter/material.dart';
import 'package:udemy/Weather_forecast/forecast_card.dart';
import 'package:udemy/Weather_forecast/weather_forecastModdel.dart';


Widget bottomView(AsyncSnapshot<WeatherForecast> snapshot, BuildContext context) {



  var forecastList = snapshot.data!.main;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),style: TextStyle(fontSize: 14,color: Colors.black87),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: 7,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: forecastCard(snapshot, index),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff9661C3),Colors.white],
                  begin: Alignment.topLeft, end: Alignment.bottomRight
                )
              ),
            ),
          ),
        ),
      )
    ],
  );
}