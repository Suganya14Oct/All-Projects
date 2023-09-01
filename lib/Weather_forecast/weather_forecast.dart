import 'package:flutter/material.dart';
import 'package:udemy/Weather_forecast/botto_view.dart';
import 'package:udemy/Weather_forecast/mid_view.dart';
import 'package:udemy/Weather_forecast/network.dart';
import 'package:udemy/Weather_forecast/weather_forecastModdel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather extends StatefulWidget {

  @override
  State<Weather> createState() => _WeatherState();
}


class _WeatherState extends State<Weather> {

   Future<WeatherForecast>? forecastObject;
   String? _cityNmae = "Dindigul";

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityNmae);
    print(_cityNmae);
    
    // forecastObject!.then((weather) => {
    //   print(weather.wind!.speed),
    //   print(weather.name),
    //   print(weather.weather![0].description),
    //   //print(weather.coord[0].name[0].lat)  ---  nested into nested json
    // });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 40),
            textFieldView(),
            Container(
              child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      midView(snapshot),
                      bottomView(snapshot, context)
                    ],
                  );
                }else{
                  return _cityNmae == "Karnataka" ? Container(child:
                      Center(child: CircularProgressIndicator(),)
                  ) : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Center(child: Text("${_cityNmae}",style: TextStyle(fontWeight: FontWeight.bold),))),
                  );
                }
              },),
            )
          ],
        ),
      ),
    );
  }
  Widget textFieldView(){
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
        ),
        onSubmitted: (value){
          setState(() {
            _cityNmae = value;
            forecastObject = new Network().getWeatherForecast(cityName: _cityNmae);
          });
        },
      ),
    );
   }
}
