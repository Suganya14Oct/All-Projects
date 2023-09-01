import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udemy/quakes_map_app/quake_model.dart';


class QuakesNetwork{

  Future<Quake> getAllQuakes() async {
    var apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

    final response = await http.get(Uri.parse(apiUrl));
    print("Url: ${apiUrl}");

    if(response.statusCode == 200){
      print("response: ${response.body}");
      return Quake.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Error getting Quakes");
    }
  }

}