import 'package:flutter/material.dart';
import 'package:udemy/Jokes_app_orientation/joke_details.dart';
import 'package:udemy/Jokes_app_orientation/joke_listing.dart';
import 'package:udemy/Jokes_app_orientation/joke_model.dart';
import 'package:udemy/Jokes_app_orientation/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {

  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {

  static const int tabletBreakpoint = 600;
  Joke? _selectedjoke;

  Widget _buildMobileLayout() {
    return  JokeListing(jokeSelectedCall: (jokeSelected){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return JokeDetails(isInTabletLayout: false,joke: jokeSelected,);
      }));
    });
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(
              jokeSelectedCall: (joke){
                setState(() {
                  _selectedjoke = joke;
                });
              }, jokeSelected: _selectedjoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(isInTabletLayout: true, joke: _selectedjoke,),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.portrait && shortestSide < tabletBreakpoint){

    content = _buildMobileLayout();

    }else{

      content = _buildTabletLayout();

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
