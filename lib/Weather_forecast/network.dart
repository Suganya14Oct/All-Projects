import 'dart:convert';
import 'package:udemy/Weather_forecast/forecast_util.dart';
import 'package:udemy/Weather_forecast/weather_forecastModdel.dart';
import 'package:http/http.dart' as http;

class Network {

  Future<WeatherForecast> getWeatherForecast({String? cityName}) async {

    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q="+cityName!+
        "&APPID="+Util.appId.toString()+"&unit=imperial";

    final response = await http.get(Uri.parse(finalUrl));
    print("Url: ${finalUrl}");

    if(response.statusCode == 200){
      print("response: ${response.body}");
      return WeatherForecast.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Error getting Weather Forecast");
    }

  }

}