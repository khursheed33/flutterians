import 'package:flutter/material.dart';

class FlutteriansContainerAnimation extends StatefulWidget {
  const FlutteriansContainerAnimation({Key? key}) : super(key: key);

  @override
  _FlutteriansContainerAnimationState createState() =>
      _FlutteriansContainerAnimationState();
}

class _FlutteriansContainerAnimationState
    extends State<FlutteriansContainerAnimation> {
  bool _updateMe = false;
  final _myDuration = Duration(seconds: 3);
  Color color1 = Colors.red;
  final Color color2 = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _updateMe = !_updateMe;
            color1 = color2;
          });
        },
        child: AnimatedContainer(
          color: Colors.yellow,
          duration: _myDuration,
          curve: Curves.easeIn,
          child: Container(
            height: _updateMe ? 200 : 300,
            width: _updateMe ? 300 : 200,
          ),
        ),
      ),
    );
  }
}
