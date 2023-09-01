import 'package:flutter/material.dart';
import 'package:udemy/Animations/chain_animation.dart';
import 'package:udemy/Animations/counter_animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {

 final String? title;

  MyHomePage({Key? key, this.title}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 1800),vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    animation!.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller!.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller!.forward();
      }
    });
    controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChainAnimation(animation: animation,));
  }
  @override
  void dispose() {

    super.dispose();
  }
}

