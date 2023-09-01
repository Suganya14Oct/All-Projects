import 'package:flutter/material.dart';
import 'package:udemy/True_citizen/question_model.dart';

class Aaaset extends StatefulWidget {

  @override
  State<Aaaset> createState() => _AaasetState();
}

class _AaasetState extends State<Aaaset> {

  int currentQuestionIndex = 0;

  List questionBank = [
    Question.name("India was intermittently disturbed by incursions from beyond its northern mountain wall.", true),
    Question.name(
        "With roughly one-sixth of the world’s total population, India is the second most populous country, after China.",
        true),
    Question.name(
        "Direct administration by the British, which began in 1850, effected a political and economic unification of the subcontinent",
        false),
    Question.name(
        "India remains one of the most ethnically diverse countries in the world.",
        true),
    Question.name(
        "India’s frontier, which is roughly one-third coastline, abuts eight countries.",
        false),
    Question.name(
        "In area, India ranks as the seventh largest country in the world.",
        true),
    Question.name(
        " India has five union territories composed entirely of islands",
        false),
    Question.name(
        "India’s present-day relief features have been superimposed on three basic structural units",
        true),
    Question.name(
        " The Great Himalayas, ranging from 30 to 45 miles (50 to 75 km) wide, include some of the world’s highest peaks",
        true),
    Question.name(
        "The Great Himalayas lie mostly below the line of perpetual snow and thus contain most of the Himalayan glaciers",
        false),
    Question.name(
        "The Ganges (Ganga) River basin (in India, mainly in Uttar Pradesh and Bihar states) forms the central and principal part of the plain",
        true),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              //color: Colors.cyan,
              margin: EdgeInsets.all(30.0),
              child: Image.asset("assets/indian_flag.webp"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.5),
                  border: Border.all(
                      color: Colors.blueGrey.shade400, style: BorderStyle.solid)
              ),
              height: 120,
              width: 350,
              //color: Colors.cyan,
              child: Center(child: Text(questionBank[currentQuestionIndex % questionBank.length].questionText, style: TextStyle(fontSize: 16.9,color: Colors.white))),
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    _previousQuestion();
                  }, child: Icon(Icons.arrow_back,color: Colors.white),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                ),
                TextButton(
                  onPressed: (){
                    setState(() {
                      questionBank[currentQuestionIndex % questionBank.length].isCorrect == true ?
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("Yes Correct!!"), duration: Duration(milliseconds: 300),backgroundColor: Colors.green, ), ) :
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("InCorrect!"), duration: Duration(milliseconds: 300),backgroundColor: Colors.red, ), );
                    });
                  }, child: Text("TRUE",style: TextStyle(color: Colors.white),),
                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                ),
                TextButton(
                  onPressed: (){
                    setState(() {
                         questionBank[currentQuestionIndex % questionBank.length].isCorrect == false ?
                         ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("Yes Correct!!"), duration: Duration(milliseconds: 300),backgroundColor: Colors.green, ), ) :
                         ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("InCorrect!"), duration: Duration(milliseconds: 300),backgroundColor: Colors.red, ), );
                    });
                  }, child: Text("FALSE",style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                ),
                TextButton(
                  onPressed: (){
                    _nextQuestion();
                  }, child: Icon(Icons.arrow_forward,color: Colors.white),
                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _previousQuestion(){
    setState(() {
      currentQuestionIndex = (currentQuestionIndex+1) % questionBank.length;
    });
  }

  _nextQuestion(){
    setState(() {
      currentQuestionIndex++;
    });

  }
}