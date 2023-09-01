import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {

  @override
  State<CounterAnimator> createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? animation;
  int _counter = 0;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: Duration(seconds: 3),
        vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(_controller!)
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller!.reverse(from: 5.0);
      }else if(status == AnimationStatus.completed){
        this.setState(() {
          _counter = _counter - 400;
          debugPrint("=====>Reducing====> | $_counter");
        });
      }
    })
    ..addListener(() {
      this.setState(() {
        debugPrint("Animation Tween ${animation!.value}");
      });
    });
   // animation = new CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    _controller!.addListener(() {
      this.setState(() {
        _counter++;
        debugPrint("print $_counter");
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Center(
        child: GestureDetector(
          child: Text(_controller!.isAnimating ? (_counter).toStringAsFixed(2) : "Let's Begin",
          style: TextStyle(fontSize: 24.0 * animation!.value + 16.0),),
          onTap: (){
            _controller!.forward(from: 0.0);
          },
        ),
      ),
    );
  }
}

