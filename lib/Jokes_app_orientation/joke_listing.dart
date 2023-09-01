import 'package:flutter/material.dart';
import 'package:udemy/Jokes_app_orientation/joke_model.dart';

class JokeListing extends StatelessWidget {

  final ValueChanged<Joke>? jokeSelectedCall;
  final Joke? jokeSelected;

  JokeListing({@required this.jokeSelectedCall, @required this.jokeSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          child: ListTile(
            title: Text(joke.setup.toString()),
            onTap: (){
              jokeSelectedCall!(joke);
            },
            selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5)
          ) ,
        );
        }).toList(),
    );
  }
}


