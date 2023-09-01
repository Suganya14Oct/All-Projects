import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udemy/Animations/flutter_animations.dart';
import 'package:udemy/Firebase_push_notification/firebase_api.dart';
import 'package:udemy/Google_maps/show_map.dart';
import 'package:udemy/Jokes_app_orientation/master_detail_screen.dart';
import 'package:udemy/Json_parsing/parsing_json.dart';
import 'package:udemy/True_citizen/aset.dart';
import 'package:udemy/Weather_forecast/weather_forecast.dart';
import 'package:udemy/board_firebase/board_app.dart';
import 'package:udemy/Company/company_details_animator.dart';
import 'package:udemy/quakes_map_app/quakes_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:udemy/Firebase_push_notification/firebase_api.dart';



void main()  {
  runApp( Home());
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompanyDetailsAnimator(),
    );
  }
}

