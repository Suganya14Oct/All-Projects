import 'package:flutter/material.dart';
import 'package:udemy/Jokes_app_orientation/joke_model.dart';

class JokeDetails extends StatelessWidget {

  final bool? isInTabletLayout;
  final Joke? joke;

  JokeDetails({@required this.isInTabletLayout, @required this.joke});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(joke?.setup ?? "No joke Selected",
          style: textTheme.headlineSmall,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(joke?.punchline ?? "Please select a joke on the left,",
          style: textTheme.subtitle1,),
        )
      ],
    );
    if(isInTabletLayout!){
      return Center(child: content,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? 'No Jokes'),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(child: content,),
    );
  }
}

